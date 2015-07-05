fib = [1,2]
print sum([n for n in [(fib.append(fib[i-2]+fib[i-1]), fib[i])[1] for i in xrange(2,100)] if n<4000000 and n%2 is 0])
