# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt

def myDFT(x):
    N = len(x)
    F = []
    for k in range(N):
        Fk = 0
        for n,val in enumerate(x):
            Fk += x[n] * np.exp(-1j*2*np.pi*k*n/N)
        F.append(Fk)
    return F
def myDFT2(x):
    N = len(x)
    F = []
    for k in range(N):
        Fk = 0
        for n in range(N):
            Fk += x[n]*np.exp(-1j*2*np.pi*k*n/N)
        F.append(Fk)
    return F

def myDFT_THOR(x):
    N = len(x)
    ak = [0] * N
    for k in range(N):
        for n in range(N):
            ak[k] += x[n] * np.exp(-1j*k*((2*np.pi)/N)*n)
    return ak

def boxsignal(VecStart,VecValueStart, VecValueEnd, VecEnd):
    length = VecEnd-VecStart+1
    h = np.zeros(length)
    n = np.arange(VecStart,VecEnd+1,1,dtype=int)
    print('my n',n)
    for i in n:
        if i >= VecValueStart and i <= VecValueEnd:
            h[i-VecStart] = 1
    return h,n

def myStemplot(x,y,xl,yl,name):
    plt.figure(name)
    markerline, stemlines, baseline = plt.stem(x,y,linefmt = '-')
    plt.setp(stemlines,'color','b', 'linewidth','2.0')
    plt.axis([x[0]-10,x[len(x)-1]+10,-30,30])
    plt.ylabel(yl)
    plt.xlabel(xl)
    plt.grid(True)
    plt.show()




def compare(h,n):
    print('\nMy h of length %i:\n'%len(h),h)
    dft = myDFT(h)
    dftTHOR = myDFT_THOR(h)
    fft = np.fft.fft(h)
    print('\nMy dft of length %i:\n'%len(dft),dft)
    #print('\nMy THOR of length %i:\n'%len(dftTHOR),dftTHOR)
    
    #print('\nMy real dft of length %i:\n'%len(dft),np.real(dft))
    print('\nMy fft of length %i:\n'%len(fft),fft)
    #dft = fft

    dft_Real = []
    dft_Im = []
    dft_Abs = []
    dft_Ang = []
    for i in n:
        #print('i:',i,'n:',n[i])
        dft_Real.append(np.real(dft[i]))
        dft_Im.append(np.imag(dft[i]))
        dft_Abs.append(np.absolute(dft[i]))
        dft_Ang.append(np.angle(dft[i]))


    plt.figure()
    plt.subplot(3, 1, 1)
    plt.stem(n, h)
    plt.ylabel('x[n]')
    plt.title('Reiknirit 3')

    plt.subplot(3, 2, 3)
    plt.stem(n, dft_Real)
    plt.ylabel('RealValue')

    plt.subplot(3, 2, 5)
    plt.stem(n, dft_Im)
    plt.ylabel('ImagValue')

    plt.subplot(3, 2, 4)
    plt.stem(n, dft_Abs)
    plt.ylabel('AbsValue')

    plt.subplot(3, 2, 6)
    plt.stem(n, dft_Ang)
    plt.ylabel('AngleValue')

    plt.show()

N = 20
N1 = N/2


h,n = boxsignal(-N,-N/2,N/2,N)
myStemplot(n,h,'n','h[n]','Reiknirit1')
compare(h,n)

n = np.arange(-2,2+1,1,dtype=int)
h = np.sin(np.pi/2*n)
myStemplot(n,h,'n','h[n]','Reiknirit1')
compare(h,n)