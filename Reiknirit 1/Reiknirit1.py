# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt

def myStemplot(x,y,xl,yl,name):
    plt.figure(name)
    markerline, stemlines, baseline = plt.stem(x,y,linefmt = '-')
    plt.setp(stemlines,'color','b', 'linewidth','2.0')
    #plt.setp(baseline, 'color','r', 'linewidth', 2)
    plt.axis([x[0],x[len(x)-1],-1,5])
    plt.ylabel(yl)
    plt.xlabel(xl)
    plt.grid(True)
    plt.show()


xmin = -8
xmax = 6
length = xmax-xmin+1

y = np.zeros(length)
n = np.linspace(xmin,xmax,length)
n2 = np.linspace(2*xmin,2*xmax,2*length-1)

y[3-xmin] = 1

myStemplot(n,y,'n','y[n]','Reiknirit1')



x = np.zeros(length)
x[1-xmin] = 1
x[2-xmin] = 1
x[3-xmin] = 1
x[4-xmin] = 1

myStemplot(n,x,'n','x[n]','Reiknirit1')

z = np.convolve(x,y)

print(n)
print(len(n))

print(n2)
print(len(n2))

myStemplot(n2,z,'n','z[n]','Reiknirit1')

q = np.zeros(length)
q[1-xmin] = 0
q[2-xmin] = 1
q[3-xmin] = 2
q[4-xmin] = 1
q[5-xmin] = 0

r = np.convolve(x,q)
myStemplot(n2,r,'n','z[n]','Reiknirit1')
