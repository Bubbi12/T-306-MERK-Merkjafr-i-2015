# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt

def myStemplot(x,y,xl,yl,name):
    plt.figure(name)
    markerline, stemlines, baseline = plt.stem(x,y,linefmt = '-.')
    plt.setp(stemlines, 'linewidth','2.0')
    plt.setp(baseline, 'color','r', 'linewidth', 2)
    plt.axis([x[0],x[len(x)-1],0,2])
    plt.ylabel(yl)
    plt.xlabel(xl)
    plt.grid(True)
    plt.show()

y = np.zeros(15)
n = np.linspace(-8,6,15)

y[11] = 1

print(len(n))
print(len(y))
print(n)
print(y)
myStemplot(n,y,'n','y[n]','Reiknirit1')

print(n)
print(y)


x = np.zeros(15)
x[9] = 1
x[10] = 1
x[11] = 1
x[12] = 1

myStemplot(n,x,'n','x[n]','Reiknirit1')

print(x[0])
print(y[0])

z = np.convolve(x,y)
print(z)
print(len(z))
print(z[20])

n = np.linspace(-16,12,29)
print(n)
print(len(n))

myStemplot(n,z,'n','z[n]','Reiknirit1')
