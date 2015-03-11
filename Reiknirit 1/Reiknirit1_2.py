# Reiknirit 1 fyrir Merkjafræði 2015

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

def myDFT(x):
    N = len(x)
    F = []
    for k in range(N):
        Fk = 0
        for n,val in enumerate(x):

            Fk += x[n] * np.exp(1j*2*np.pi*k*n/N)/N # It dosnt matter if we have -J og +J 
        F.append(Fk)
    return F


def boxsignal(VecStart,VecValueStart, VecValueEnd, VecEnd):
    length = VecEnd-VecStart+1
    h = np.zeros(length)
    n = np.arange(VecStart,VecEnd+1,1,dtype=int)
    for i in n:
        if i >= VecValueStart and i <= VecValueEnd:
            h[i-VecStart] = 1
    return h,n

def myStemplot(x,y,xl,yl,name, title = ''):
    plt.figure(name)
    markerline, stemlines, baseline = plt.stem(x,y,linefmt = '-')
    plt.setp(stemlines,'color','b', 'linewidth','2.0')
    plt.axis([-20,20,-5,5])
    plt.ylabel(yl)
    plt.title(title)
    plt.xlabel(xl)
    plt.grid(True)
    plt.show()




def compare(h,n, title):
    dft = myDFT(h)
    fft = np.fft.fft(h)
    

    df_Fourier = pd.DataFrame({'Values from myDFT function':dft, 'Values from fft function':fft})

    print(df_Fourier)

    #dft = fft

    dft_Real = []
    dft_Im = []
    dft_Abs = []
    dft_Ang = []
    fft_Real = []
    fft_Im = []
    fft_Abs = []
    fft_Ang = []
    for i in n:
        dft_Real.append(np.real(dft[i]))
        dft_Im.append(np.imag(dft[i]))
        dft_Abs.append(np.absolute(dft[i]))
        dft_Ang.append(np.angle(dft[i]))
        fft_Real.append(np.real(fft[i]))
        fft_Im.append(np.imag(fft[i]))
        fft_Abs.append(np.absolute(fft[i]))
        fft_Ang.append(np.angle(fft[i]))

    df_Fourier_Real = pd.DataFrame({'Real Values from myDFT':dft_Real, 'Real Value from fft':fft_Real})

    print(df_Fourier_Real)

    df_Fourier_Img = pd.DataFrame({'Imag Values from myDFT':dft_Im, 'Imag Value from fft':fft_Im})

    print(df_Fourier_Img)

    df_Fourier_Abs = pd.DataFrame({'Abs Values from myDFT':dft_Abs, 'Abs Value from fft':fft_Abs})

    print(df_Fourier_Abs)

    df_Fourier_Ang = pd.DataFrame({'Angular Values from myDFT':dft_Ang, 'Angular Value from fft':fft_Ang})

    print(df_Fourier_Ang)

    plt.figure('Reiknirit 1')
    plt.subplot(3, 1, 1)
    plt.stem(n, h)
    plt.ylabel('x[n]')
    plt.title(title)
    
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
myStemplot(n,h,'n','h[n]','Reiknirit1','The Box')
compare(h,n, 'Discrete Fourier Transformation of Box Signal')

n = np.arange(-2,2+1,1,dtype=int)
h = np.sin(np.pi/2*n)
myStemplot(n,h,'n','h[n]','Reiknirit1', 'The Sinusoidal Wave')
compare(h,n, 'Discrete Fourier Transformation of Sinusodial Wave')
