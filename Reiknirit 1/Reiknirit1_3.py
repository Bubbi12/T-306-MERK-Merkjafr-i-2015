# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import matplotlib.pyplot as plt

def sWF(T1,T,N):
    a0 = (2*T1)/T
    k = 2*N+1
    ak = np.zeros(k)
    stakes = 0
    for i in np.arange(-N,N+1,1):
        if i == 0:
            ak[stakes] = a0
        else:
            ak[stakes] = np.sin(i*T1*2*np.pi/T)/(i*np.pi)
        stakes += 1
    print(ak)
    return ak

sWF(1,4,10)