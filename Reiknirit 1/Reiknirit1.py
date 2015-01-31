# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt


n = np.zeros((1,10))
y = np.linspace(-3,6,10)
x = -3

n[0,6] = 1
# for i in range (0,10):
# 	n.append(x)
# 	y.append(0)
# 	if x is 3:
# 		y.append(1)
# 	x = x + 1

print(len(n))
print(len(y))

markerline, stemlines, basline = plt.stem(y,n[0],linefmt = 'b')
plt.setp(stemlines, 'linewidth','2.0')
plt.axis([-5,5,0,2])
plt.ylabel('')
plt.xlabel('n')
plt.show()

print(n)
print(y)