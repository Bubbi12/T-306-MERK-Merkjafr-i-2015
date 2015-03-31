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

% N�stu fj�rar l�nur virka l�ka sem plott en �� f�um vi� engin g�gn og
% getum �� ekki b�tt neinu vi� plottin
% ----------------------------
    % figure('name','IIR s�an - Freq response')
    % freqz(b1,a1)
    % figure('name','FIR s�an - Freq response')
    % freqz(b2,a2)
% ----------------------------

subplot(2,1,1)
[H1,w1]=freqz(b1,a1);
[H2,w2]=freqz(b2,a2);
plot(w1/pi,20*log10(abs(H1)),'b');
hold on;
plot(w2/pi,20*log10(abs(H2)),'r');
grid on;
legend('H1','H2');
xlabel('T��ni [*pi rad/sample]')
ylabel('�tslag[dB]')
% ----------- Phase response -----------
subplot(2,1,2)
[phiFIR,w1_p] = phasez(b1,a1); 
[phiIIR,w2_p] = phasez(b2,a2); 

plot(w1_p/pi,unwrap(phiFIR),'b');
hold on
plot(w2_p/pi,unwrap(phiIIR),'r');
legend('H1','H2');
xlabel('T��ni [*pi rad/sample]')
ylabel('Rad�anar')
grid on

% ----------- Determine Roots for IIR -----------
z1 = roots(b1); %N�ll H1(z)
p1 = roots(a1); %Skaut H1(z)
ucirc = exp(1j*(0:0.001:(2*pi))); % Einingahringurinn
roots1 = figure('Name','R�tur fyrir IIR s�una');
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

% ----------- Determine Roots for FIR -----------
z2 = roots(b2); %N�ll H2(z)
p2 = roots(a2); %Skaut H2(z)
ucirc = exp(1j*(0:0.001:(2*pi))); % Einingahringurinn
roots2 = figure('Name','R�tur fyrir IIR s�una');
plot(real(z2),imag(z2),'or','linewidth',2,'markersize',10); hold on;
%close all; plot(real(p2),imag(p1),'xb','linewidth',2,'markersize',10);
plot(real(ucirc), imag(ucirc),'k--','linewidth',2);
axis([-1.5 5 -1 1])
axis equal
xlabel('Real part');
ylabel('Imaginary part');
title('Pole-zero plot for the FIR filter');
legend('Zeros','Unit circle');
grid on;





%% Umr��a
% Hefur H2(z) skaut? 
%   Nei? H2z er allavega zero vigur

% T�lki� myndirnar me� me� tilliti til umr��u � ka?a 10.4.
% Beri� saman �tslag og horn n�llanna og skautanna vi� einingahringinn og
% tilgreini� (og teikni�) cut- o? t��ni s�anna � einingahringnum. 

% Hvernig n� n�llin og skautin a� hj�lpa til vi� a� n� fram l�ghleypis�un?

% Hvernig v�ru n�llin og skautin sta�sett ef vi� v�rum me� 
% bandhleypis�u e�a h�hleypis�u?
%IIR HIGHPASS
[b1,a1]=ellip(N1,Rp,Rs,fc/fnyq,'high');
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
title('Pole-zero plot for the IIR high-pass filter');
legend('Zeros','Poles','Unit circle');
grid on;
