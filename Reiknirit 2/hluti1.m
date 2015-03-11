clear all; close all; clc
% --------- Uppsetning ---------

A = [1 1 1];        % [A1 A2 A3] útslag
f = [300 730 1500]; % [f1 f2 f3] tíðni, Hz
fasi = [0 0 0];     % Fasar 1 til 3

fs = 8000; %Söfnunartíðni skilgreind sem 8000 Hz
Ts = 1/fs; %Þetta er óþarfi.. bara til að sýna Ts
n = -400:1:400;
t = n/fs;% = n*Ts

%% --------- Liður 1 - 4 ---------

xn1 =  A(1)*sin(2*pi*f(1)*t + fasi(1));  
xn2 =  A(2)*sin(2*pi*f(2)*t + fasi(2));  
xn3 =  A(3)*sin(2*pi*f(3)*t + fasi(3));  

task1to4(fs,n,xn1,xn2,xn3);


 
%% --------- Liður 5. ---------

f = [2500 3500 5500]; % [f1 f2 f3] tíðni, Hz

xn1 =  A(1)*sin(2*pi*f(1)*t + fasi(1)); 
xn2 =  A(2)*sin(2*pi*f(2)*t + fasi(2));  
xn3 =  A(3)*sin(2*pi*f(3)*t + fasi(3));  

task1to4(fs,n,xn1,xn2,xn3);
