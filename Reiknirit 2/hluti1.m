clear all; close all; clc
% --------- Uppsetning ---------

A = [1 1 1];        % [A1 A2 A3] �tslag
f = [300 730 1500]; % [f1 f2 f3] t��ni, Hz
fasi = [0 0 0];     % Fasar 1 til 3

fs = 8000; %S�fnunart��ni skilgreind sem 8000 Hz
Ts = 1/fs; %�etta er ��arfi.. bara til a� s�na Ts
n = -400:1:400;
t = n/fs;% = n*Ts

%% --------- Li�ur 1 - 4 ---------

xn1 =  A(1)*sin(2*pi*f(1)*t + fasi(1));  
xn2 =  A(2)*sin(2*pi*f(2)*t + fasi(2));  
xn3 =  A(3)*sin(2*pi*f(3)*t + fasi(3));  

task1to4(fs,n,xn1,xn2,xn3);


 
%% --------- Li�ur 5. ---------

f = [2500 3500 5500]; % [f1 f2 f3] t��ni, Hz

xn1 =  A(1)*sin(2*pi*f(1)*t + fasi(1)); 
xn2 =  A(2)*sin(2*pi*f(2)*t + fasi(2));  
xn3 =  A(3)*sin(2*pi*f(3)*t + fasi(3));  

task1to4(fs,n,xn1,xn2,xn3);
