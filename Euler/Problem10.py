from __future__ import print_function
from math import sqrt
def isPrime(num):
    for i in range(2,int(sqrt(num)+1)):
        if num % i == 0:
            return False
    return True

Sum = 0
for i in range(2,2*(10**6)):
    if isPrime(i):
        Sum += i
print(Sum)
