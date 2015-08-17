from __future__ import print_function
def Problem9():
    for a in range(1,500):
        for b in range(1,500):
            c = 1000 - (a+b)
            if a**2+b**2==c**2:
                return a*b*c

print (Problem9())
