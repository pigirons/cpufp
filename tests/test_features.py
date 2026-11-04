#!/usr/bin/env python3
"""Compile feature probes with mock OS APIs; no ARM hardware is required."""
import os
from pathlib import Path
import shlex
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
CC = shlex.split(os.environ.get("CC", "cc"))
CAPS = {
    "HWCAP_ASIMD": 1 << 1, "HWCAP_ASIMDHP": 1 << 10,
    "HWCAP_ASIMDDP": 1 << 20, "HWCAP_SVE": 1 << 22,
    "HWCAP2_I8MM": 1 << 13, "HWCAP2_BF16": 1 << 14,
    "HWCAP2_SVE2": 1 << 1, "HWCAP2_SME": 1 << 23,
    "HWCAP2_SME_I8I32": 1 << 26, "HWCAP2_SME_F16F32": 1 << 27,
    "HWCAP2_SME_B16F32": 1 << 28, "HWCAP2_SME_F32F32": 1 << 29,
    "HWCAP2_SME2": 1 << 37,
}

with tempfile.TemporaryDirectory(prefix="cpufp-features-") as temporary:
    work = Path(temporary)
    (work / "asm").mkdir()
    (work / "sys").mkdir()
    (work / "sys/auxv.h").write_text(
        "#define AT_HWCAP 16\n#define AT_HWCAP2 26\n"
        "unsigned long getauxval(unsigned long);\n")
    (work / "linux.c").write_text('''
#include <stdlib.h>
#include <stdio.h>
#include "arm64_features.h"
unsigned long getauxval(unsigned long type)
{
    return strtoul(getenv(type == 16 ? "CAP1" : "CAP2"), 0, 0);
}
int main(void) { printf("%llu\\n", (unsigned long long)arm64_get_features()); }
''')
    for old_headers in (False, True):
        caps = {k: v for k, v in CAPS.items() if not old_headers or "SME" not in k}
        (work / "asm/hwcap.h").write_text("".join(
            "#define %s %dULL\n" % (key, value) for key, value in caps.items()))
        binary = work / "linux"
        subprocess.run(CC + ["-U__APPLE__", "-D__linux__", "-I" + str(work),
            "-I" + str(ROOT / "arm64"), str(ROOT / "arm64/features.c"),
            str(work / "linux.c"), "-o", str(binary)], check=True)
        cases = [(0, 0, 0), (CAPS["HWCAP2_I8MM"] | CAPS["HWCAP2_BF16"], 0, 0),
                 (0, CAPS["HWCAP2_I8MM"] | CAPS["HWCAP2_BF16"], (1 << 4) | (1 << 3)),
                 (CAPS["HWCAP_SVE"], CAPS["HWCAP2_SVE2"], (1 << 5) | (1 << 6)),
                 (0, CAPS["HWCAP2_SME"] | CAPS["HWCAP2_SME2"] |
                  CAPS["HWCAP2_SME_F16F32"], 0 if old_headers else (1 << 7) | (1 << 8) | (1 << 10))]
        for cap1, cap2, expected in cases:
            result = subprocess.check_output([str(binary)], env=dict(os.environ,
                CAP1=str(cap1), CAP2=str(cap2)), text=True)
            assert int(result) == expected, (old_headers, cap1, cap2, result, expected)
        print("PASS Linux capability banks and %s SME headers" % ("old" if old_headers else "current"))

    (work / "sys/sysctl.h").write_text(
        "#include <stddef.h>\nint sysctlbyname(const char *, void *, size_t *, void *, size_t);\n")
    (work / "darwin.c").write_text('''
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include "arm64_features.h"
int sysctlbyname(const char *name, void *value, size_t *size, void *newval, size_t newsize)
{
    const char *requested = getenv("FEATURE");
    *(int *)value = strcmp(name, requested) == 0;
    return 0;
}
int main(void) { printf("%llu\\n", (unsigned long long)arm64_get_features()); }
''')
    binary = work / "darwin"
    subprocess.run(CC + ["-U__linux__", "-D__APPLE__", "-I" + str(work),
        "-I" + str(ROOT / "arm64"), str(ROOT / "arm64/features.c"),
        str(work / "darwin.c"), "-o", str(binary)], check=True)
    for key, expected in [("unknown", 0), ("hw.optional.arm.FEAT_I8MM", 1 << 4),
            ("hw.optional.arm.FEAT_SME", (1 << 7) | (1 << 9) | (1 << 10) | (1 << 11) | (1 << 12)),
            ("hw.optional.arm.FEAT_SME2", 1 << 8)]:
        result = subprocess.check_output([str(binary)], env=dict(os.environ,
            FEATURE=key), text=True)
        assert int(result) == expected, (key, result, expected)
        assert int(result) & ((1 << 5) | (1 << 6)) == 0, "SME must not imply SVE"
    print("PASS Darwin sysctls; SME does not imply non-streaming SVE")
