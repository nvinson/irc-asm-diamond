#!/usr/bin/env python

import sys

def row(width: int, row: int) -> str:
    buff = [" " for _ in range(width)]
    mid = width // 2
    buff[mid] = "*"
    for x in range(mid - row, mid + row + 1):
        buff[x] = "*"
    return "".join(c for c in buff)


size = int(sys.argv[1])

for x in range(size // 2):
    print(row(size, x))

for x in reversed(range(size // 2)):
    print(row(size, x))
