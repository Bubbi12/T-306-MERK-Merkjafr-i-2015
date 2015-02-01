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

def boxsignal(VecStart,VecValueStart, VecValueEnd, VecEnd):
    length = VecEnd-VecStart+1
    h = np.zeros(length)
    n = np.linspace(VecStart,VecEnd,length)
    for i in n:
        if i >= VecValueStart and i <= VecValueEnd:
            h[i-VecStart] = 1
    return h,n


def myconv(x, nx, h, nh):
    length = (len(nx) + len(nh) -1)
    y = np.zeros(length)
    Listh = h.tolist()
    Listh.reverse()
    Nump = np.array(Listh)

    for i in range(0,len(Nump)):
        if Nump[i] != 0:
            n = i + 2
    for i in range(0,len(Nump)):
        if x[i] != 0:
            t = i
            break
    DasCounter = t - n

    count = 0
    count2 = 0
    Tel = 0
    temp3 = np.zeros(shape=(len(Nump),len(Nump)))
    temp4 = np.zeros(shape=(len(Nump),len(Nump)))
    for n in range(0,len(Nump)):
        if Nump[n] != 0:
            temp3[0,count + count2] = Nump[n]
            if count is 0:
                Tel = Tel - n
            if count is 0:
                x2 = list(map(lambda x: x + n, nh))
                Tel = n
            count += 1

    for j in range(0,len(Nump)-1):
        for i in range(len(Nump),0,-1):
            temp3[j+1,i-1] = temp3[j,i-2]
        
    temp3[10,0] = 0

    y = np.zeros(len(Nump))
    ny = []
    count = 0
    for i in range(0,len(Nump)):
        for j in range(0,len(Nump)):
            y[i] = y[i] + x[j] * temp3[i,j]
        if y[i] != 0:
            ny.append(DasCounter+count)
            count += 1
        if y[i] == 0 and count != 0:
            ny.append(DasCounter+count)
            count += 1
    Inter = 1
    while len(ny) < 15:
        ny.insert(0,DasCounter-Inter)
        Inter += 1

    return y, ny




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

h,n = boxsignal(-8,1,4,6)
myStemplot(n,h,'n','h[n]','Reiknirit1')

ramp = np.convolve(h,h)
# Kassamerki faldað við kassamerki,
# Til að fá Ramp merki þyrftum við að falda Heaviside merki með öðru Heaviside með engum takmörkunum
myStemplot(n2,ramp,'n','ramp[n] (h*h)','Reiknirit1')

Z, nZ = myconv(x,n,y,n)
myStemplot(nZ,Z,'n','y[n]','Reiknirit1')


R, nR = myconv(x,n,q,n)
myStemplot(nR,R,'n','y[n]','Reiknirit1')