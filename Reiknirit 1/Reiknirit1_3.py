# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt

def myStemplot(x,y,xl,yl,name):
    plt.figure(name)
    markerline, stemlines, baseline = plt.stem(x,y,linefmt = '-')
    plt.setp(stemlines,'color','b', 'linewidth','2.0')
    plt.axis([x[0],x[len(x)-1],-1,2])
    plt.ylabel(yl)
    plt.xlabel(xl)
    plt.grid(True)
    plt.show()


def boxsignal(VecStart,VecValueStart, VecValueEnd, VecEnd):
    length = VecEnd-VecStart+1
    h = np.zeros(length)
    n = np.arange(VecStart,VecEnd+0.001,0.001)
    for i in n:
        if i >= VecValueStart and i <= VecValueEnd:
            h[i-VecStart] = 1
    return h,n

def sWF(T1,T,N):
    a0 = (2*T1)/T
    ak = np.zeros(2*N+1)
    stakes = 0
    klist = np.arange(-N,N+1,1)
    for k in klist:
        if k == 0:
            ak[stakes] = a0
        else:
            ak[stakes] = np.sin(k*T1*2*np.pi/T)/(k*np.pi)
        stakes += 1
    #print(ak)
    return ak, klist

N = 100
ak,n = sWF(1,4,N)
myStemplot(n,ak,'[n]','ak[n]','Reiknirit 1 part 3')
ak,n = sWF(1,8,N)
myStemplot(n,ak,'[n]','ak[n]','Reiknirit 1 part 3')
ak,n = sWF(1,16,N)
myStemplot(n,ak,'[n]','ak[n]','Reiknirit 1 part 3')
ak,n = sWF(2,16,N)
myStemplot(n,ak,'[n]','ak[n]','Reiknirit 1 part 3')




########################
# 2
########################
T1 = 1
T = 4
NN = [1,3,7,19,79]
tt = np.arange(-T/2,T/2+0.001,0.001)
bs = np.zeros(len(tt))
for i,val in enumerate(bs):
    if i>=1/0.001 and i <=3/0.001:
        bs[i]=1




for N in NN:
    ak,n = sWF(T1,T,N)
    xn = []
    En = []
    for i, t in enumerate(tt):
        xnt = 0
        for k in np.arange(-N,N+1,1):
            xnt += np.real(ak[k+N]*np.exp((1j*k*2*np.pi*t)/T))
        xn.append(xnt)
        En.append(bs[i]-xnt)

    h,n = boxsignal(-2,-1,1,2)
    plt.plot(tt,xn)
    plt.plot(tt,bs)
    plt.plot(tt,En)
    plt.show()

# Liður 3
# Fáum tvinngilt merki fyrir xN(t) vegna þess að við umskrifuðum fallið okkar með reglu Eulers svo fourier stuðlarnir sem komu út úr squareWaveFourier gefa okkur tvinngilt
# svar þegar við umskrifum til baka. Ímynduðu liðirnir styttast hinsvegar út þegar summað er frá -N til N

NN = np.arange(10,100+10,10)
EN = []
print(NN)
for N in NN:
    ak,n = sWF(T1,T,N)
    xn = []
    En = []
    for i, t in enumerate(tt):
        xnt = 0
        for k in np.arange(-N,N+1,1):
            xnt += np.real(ak[k+N]*np.exp((1j*k*2*np.pi*t)/T))
        xn.append(xnt)
        En.append((bs[i]-xnt)**2)
    EN.append(np.sum(En))
    print('for N = %i, En = %.6f'%(N,np.sum(En)))

plt.plot(NN,EN)
plt.show()