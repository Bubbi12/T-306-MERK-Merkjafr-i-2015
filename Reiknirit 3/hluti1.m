clear all; close all ;clc
fs = 44100; %Söfnunartíðni
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

% Næstu fjórar línur virka líka sem plott en þá fáum við engin gögn og
% getum þá ekki bætt neinu við plottin
% ----------------------------
    % figure('name','IIR sían - Freq response')
    % freqz(b1,a1)
    % figure('name','FIR sían - Freq response')
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
xlabel('Tíðni [*pi rad/sample]')
ylabel('Útslag[dB]')
% ----------- Phase response -----------
subplot(2,1,2)
[phiFIR,w1_p] = phasez(b1,a1); 
[phiIIR,w2_p] = phasez(b2,a2); 

plot(w1_p/pi,unwrap(phiFIR),'b');
hold on
plot(w2_p/pi,unwrap(phiIIR),'r');
legend('H1','H2');
xlabel('Tíðni [*pi rad/sample]')
ylabel('Radíanar')
grid on

% ----------- Determine Roots for IIR -----------
z1 = roots(b1); %Núll H1(z)
p1 = roots(a1); %Skaut H1(z)
ucirc = exp(1j*(0:0.001:(2*pi))); % Einingahringurinn
roots1 = figure('Name','Rætur fyrir IIR síuna');
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
z2 = roots(b2); %Núll H2(z)
p2 = roots(a2); %Skaut H2(z)
ucirc = exp(1j*(0:0.001:(2*pi))); % Einingahringurinn
roots2 = figure('Name','Rætur fyrir IIR síuna');
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





%% Umræða
% Hefur H2(z) skaut? 
%   Nei? H2z er allavega zero vigur

% Túlkið myndirnar með með tilliti til umræðu í ka?a 10.4.
% Berið saman útslag og horn núllanna og skautanna við einingahringinn og
% tilgreinið (og teiknið) cut- o? tíðni síanna á einingahringnum. 

% Hvernig ná núllin og skautin að hjálpa til við að ná fram lághleypisíun?

% Hvernig væru núllin og skautin staðsett ef við værum með 
% bandhleypisíu eða háhleypisíu?
%IIR HIGHPASS
[b1,a1]=ellip(N1,Rp,Rs,fc/fnyq,'high');
z1 = roots(b1); %Núll H1(z)
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
