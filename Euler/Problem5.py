from __future__ import print_function
n,i=2520,1
while i<=20:
   i,n = (i+1,n) if n%i==0 else (1,n+20)
print (n)
