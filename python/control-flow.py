__author__ = 'oski'

from functions import *

# Statements like this are easy to follow

a = 1
print(a + 1)

# Loops can be harder

sum_a = 0
for a in [1, 2, 3]:
    sum_a += a

print(sum_a)

# Functions add even more complexity

pairs = [(1, 2), (3, 4), (5, 6)]
complex_result = 0
for pair in pairs:
    d = add_these(pair[0], pair[1])
    complex_result = multiply_these(d, complex_result)

print(complex_result)