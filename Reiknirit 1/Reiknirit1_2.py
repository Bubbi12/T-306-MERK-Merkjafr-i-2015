# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt

def myDFT(x):
    N = len(x)
    F = []
    for k in range(N):
        Fk = 0
        for n in range(N):
            Fk += x[n]*np.exp(-1j*2*np.pi*k*n/N)
        F.append(Fk)
    return F

def boxsignal(VecStart,VecValueStart, VecValueEnd, VecEnd):
    length = VecEnd-VecStart+1
    h = np.zeros(length)
    n = np.arange(VecStart,VecEnd+1,1,dtype=int)
    for i in n:
        if i >= VecValueStart and i <= VecValueEnd:
            h[i-VecStart] = 1
    print(n)
    return h,n

def myStemplot(x,y,xl,yl,name):
    plt.figure(name)
    markerline, stemlines, baseline = plt.stem(x,y,linefmt = '-')
    plt.setp(stemlines,'color','b', 'linewidth','2.0')
    plt.axis([x[0],x[len(x)-1],-10,10])
    plt.ylabel(yl)
    plt.xlabel(xl)
    plt.grid(True)
    plt.show()

xmin = -20
xmax = 20
length = xmax-xmin+1
n = np.linspace(xmin,xmax,length)



def compare(h):
    print('\nMy h of length %i:\n'%len(h),h)
    dft = myDFT(h)
    fft = np.fft.fft(h)
    print('\nMy dft of length %i:\n'%len(dft),dft)
    print('\nMy real dft of length %i:\n'%len(dft),np.real(dft))
    print('\nMy fft of length %i:\n'%len(fft),np.real(fft))

    n3 = np.linspace(np.min(n),np.max(n),len(h))
    myStemplot(n3,fft,'n','h[n]','Reiknirit1')

h,n = boxsignal(-20,-10,10,20)
myStemplot(n,h,'n','h[n]','Reiknirit1')
compare(h)


h = np.sin(np.pi/2*n)
myStemplot(n,h,'n','h[n]','Reiknirit1')
compare(h)