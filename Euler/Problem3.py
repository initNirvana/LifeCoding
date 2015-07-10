import itertools
def factor(n):
	x = 2
	while n > x:
		if n % x == 0:
			while n % x == 0:
				n /= x
			else:
				yield x
		x += x % 2 + 1
	else:
		yield x

print max(list(factor(600851475143)))
