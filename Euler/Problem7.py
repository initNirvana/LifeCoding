from __future__ import print_function
import math
listFactor = [2]
def factorList(listFactor):
	for num in range(3,150000,2):
		if all(num % i != 0 for i in range(2,int(math.sqrt(num) +1))):
			listFactor.append(num)
factorList(listFactor)
print(listFactor[10000])
