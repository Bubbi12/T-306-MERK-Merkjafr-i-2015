clear all; close all ;clc
fs = 44100; %S�fnunart��ni
% ----------- IIR -----------
fnyq=fs/2;%Nyquistfrequency 
Rp=0.3;%Maximumrippleinthepassband 
Rs=80;%Maximumrippleinthestopband upprunaleg 60
N1=8;%Degreeoffiler  uppr 4
fc=3000;%Cut-offfrequency
[b1,a1]=ellip(N1,Rp,Rs,fc/fnyq,'low');

% ----------- FIR -----------
f=[0 fc fc fnyq]/fnyq;
m=[1 1 0 0];
N2=60; %Degree of the filter 
b2=fir2(N2,f,m); 
a2=1;

% ----------- Freq response -----------
subplot(2,1,1)
nfft=1024;
[H1,w1]=freqz(b1,a1,nfft);
[H2,w2]=freqz(b2,a2,nfft);
plot(fs*w1/(2*pi),20*log10(abs(H1)),'b');
hold on;
plot(fs*w2/(2*pi),20*log10(abs(H2)),'r');
grid on;
legend('H1','H2');
xlabel('T��ni[Hz]')
ylabel('�tslag[dB]')
% ----------- Phase response -----------
subplot(2,1,2)
[phiFIR,w1_p] = phasez(b1,a1,nfft); 
[phiIIR,w2_p] = phasez(b2,a2,nfft); 

plot(fs*w1_p/(2*pi),unwrap(phiFIR),'b');
hold on
plot(fs*w2_p/(2*pi),unwrap(phiIIR),'r');
legend('H1','H2');
xlabel('T��ni[Hz]')
ylabel('Rad�anar')
grid on

% ----------- Determine Roots for IIR -----------
z1 = roots(b1); %N�ll H1(z)
p1 = roots(a1); %Skaut H1(z)
ucirc = exp(1j*(0:0.001:(2*pi))); % Einingahringurinn
figure
plot(real(z1),imag(z1),'or','linewidth',2,'markersize',10); hold on;
plot(real(p1),imag(p1),'xb','linewidth',2,'markersize',10);
plot(real(ucirc), imag(ucirc),'k--','linewidth',2);
axis(1.3*[-1 1 -1 1])
axis equal
xlabel('Real part');
ylabel('Imaginary part');
title('Pole-zero plot for the IIR low-pass filter');
legend('Zeros','Poles','Unit circle');
grid on;

% ----------- Determine Roots for IIR -----------
z1 = roots(b2); %N�ll H2(z)
p1 = roots(a2); %Skaut H2(z)
ucirc = exp(1j*(0:0.001:(2*pi))); % Einingahringurinn
figure
plot(real(z1),imag(z1),'or','linewidth',2,'markersize',10); hold on;
% plot(real(p1),imag(p1),'xb','linewidth',2,'markersize',10);
plot(real(ucirc), imag(ucirc),'k--','linewidth',2);
axis([-1.5 5 -1 1])
axis equal
xlabel('Real part');
ylabel('Imaginary part');
title('Pole-zero plot for the FIR filter');
legend('Zeros','Unit circle');
grid on;
