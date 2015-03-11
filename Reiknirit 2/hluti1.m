clear all; close all; clc
% --------- Uppsetning ---------

A = [1 1 1];        % [A1 A2 A3] útslag
f = [300 730 1500]; % [f1 f2 f3] tíðni, Hz
fasi = [0 0 0];     % Fasar 1 til 3

fs = 8000; %Söfnunartíðni skilgreind sem 8000 Hz
Ts = 1/fs; %Þetta er óþarfi.. bara til að sýna Ts
n = -400:1:400;
t = n/fs;% = n*Ts

xn1 =  A(1)*sin(2*pi*f(1)*t + fasi(1));  %xt_1
xn2 =  A(2)*sin(2*pi*f(2)*t + fasi(2));  %xt_2
xn3 =  A(3)*sin(2*pi*f(3)*t + fasi(3));  %xt_3

% --------- Liður 1. ---------

subplot(3,1,1)
stem(t,xn1)

subplot(3,1,2)
stem(t,xn2)

subplot(3,1,3)
stem(t,xn3)

%% --------- Liður 2. ---------

p = 0.4;
soundsc(xn1,fs)
pause(p)
soundsc(xn2,fs)
pause(p)
soundsc(xn3,fs)
pause(p)

%% --------- Liður 3. ---------

xn = xn1+xn2+xn3;
soundsc(xn,fs)
figure
stem(t,xn)

%% --------- Liður 4. ---------


subplot(3,1,1)
stem(t,mag(fft(xn1)))

subplot(3,1,2)
stem(t,mag(fft(xn2)))

subplot(3,1,3)
stem(t,mag(fft(xn3)))



