#!/usr/bin/env python3

import shelve

s = shelve.open('shelvedb')

# for k in s:
#     print(k, '=>', s[k])

print(list(s.keys()))

for key in s:
    print(key, '=>', s[key])
