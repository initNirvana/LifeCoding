from __future__ import print_function

array = []
a = []

with open('euler11.txt' ,'r') as f:
    for line in f:
        line.rstrip()
        for x in range(0,len(line),3):
            a.append(line[x]+line[x+1])
        array.append(a)
        a = []

def vertical_product(inpt):
    partialprod = 1
    maximumset = set()
    for i in range(20):
        for j in range(17):
            for m in range(4):
                partialprod = partialprod*int(inpt[j+m][i])
                maximumset.add(partialprod)
            partialprod = 1
    return max(maximumset)

def horizontal_product(inpt):
    partialprod = 1
    maximumset = set()
    for i in range(17):
        for j in range(20):
            for m in range(4):
                partialprod = partialprod*int(inpt[j][i+m])
                maximumset.add(partialprod)
            partialprod = 1
    return max(maximumset)

def diagonal_product(inpt):
    partialprod = 1
    maximumset = set()
    for i in range(17):
        for j in range(17):
            for m in range(4):
                partialprod = partialprod*int(inpt[j+m][i+m])
            maximumset.add(partialprod)
            partialprod = 1
    return max(maximumset)

def orthodiagonal_product(inpt):
    partialprod = 1
    maximumset = set()
    for i in range(3,20):
        for j in range(17):
            for m in range(4):
                partialprod = partialprod*int(inpt[j+m][i-m])
            maximumset.add(partialprod)
            partialprod = 1
    return max(maximumset)



print max(
          orthodiagonal_product(array),
          diagonal_product(array),
          horizontal_product(array),
          vertical_product(array)
          )
