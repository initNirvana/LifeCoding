from __future__ import print_function
def largest_prime_factor(n):
    d1 = next (x for x in range(2,n+1) if (n % x ==0))
    if n == d1:
        return n
    else:
        return max(largest_prime_factor(d1),largest_prime_factor(int(n/d1)))

print(largest_prime_factor(600851475143))
