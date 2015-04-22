__author__ = 'oski'

# Statements like this are easy to follow

a = 1
print(a + 1)

# Loops can be harder

sum_a = 0
for a in [1, 2, 3]:
    sum_a += a

print(a)

# Functions add even more complexity

def add_these(a, b):
    c = a + b * 2
    return c

def multiply_these(a, b):
    c = a * b + 2
    return c

pairs = [(1, 2), (3, 4), (5, 6)]
complex_result = 0
for pair in pairs:
    d = add_these(pair[0], pair[1])
    complex_result = multiply_these(d, complex_result)

print(complex_result)