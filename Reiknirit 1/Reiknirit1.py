# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt


y = np.zeros((1,15))
n = np.linspace(-8,6,15)

y[0,11] = 1

print(len(n))
print(len(y[0]))
print(n)
print(y)
markerline, stemlines, basline = plt.stem(n,y[0],linefmt = 'b')
plt.setp(stemlines, 'linewidth','2.0')
plt.axis([n[0],n[len(n)-1],0,2])
plt.ylabel('')
plt.xlabel('n')
plt.show()

print(n)
print(y)


x = np.zeros((1,15))
x[0,9] = 1
x[0,10] = 1
x[0,11] = 1
x[0,12] = 1

markerline, stemlines1, basline = plt.stem(n,x[0],linefmt = 'b')
plt.setp(stemlines1, 'linewidth','2.0')
plt.axis([n[0],n[len(n)-1],0,2])
plt.ylabel('')
plt.xlabel('n')
plt.show()

print(x[0])
print(y[0])

z = np.convolve(x[0],y[0])
print(z)
print(len(z))
print(z[20])

n = np.linspace(-15,13,29)
print(n)
print(len(n))

markerline, stemlines1, basline = plt.stem(n,z,linefmt = 'b')
plt.setp(stemlines1, 'linewidth','2.0')
plt.axis([n[0],n[len(n)-1],0,2])
plt.ylabel('')
plt.xlabel('n')
plt.show()
