#!/usr/bin/env python3

import os
import subprocess
import sys
import time


def main(files):
    for file in files:
        stats = os.stat(file)
        last_modfied = time.time() - stats.st_mtime
        if last_modfied < 60:
            subprocess.run(["shutdown", "-P"])


if __name__ == "__main__":
    FILES = sys.argv[1:]
    main(FILES)
