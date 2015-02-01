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


xmin = -8
xmax = 6
length = xmax-xmin+1

y = np.zeros(length)
n = np.linspace(xmin,xmax,length)

y[3-xmin] = 1

myStemplot(n,y,'n','y[n]','Reiknirit1')



x = np.zeros(15)
x[1-xmin] = 1
x[2-xmin] = 1
x[3-xmin] = 1
x[4-xmin] = 1

myStemplot(n,x,'n','x[n]','Reiknirit1')

z = np.convolve(x,y)
print(n)
print(len(n))
n = np.linspace(2*xmin,2*xmax,2*length-1)
print(n)
print(len(n))

myStemplot(n,z,'n','z[n]','Reiknirit1')
