%%
clear all; clc; close all;

load corruptedspeech.mat fs sp

% ----------- Tal � su�i 2.1 -----------
nshift=50000;%T�mahli�run 
winlen=1024;%ca23ms@fs=44100 
nn=(1:winlen)+nshift;%T�maindexb�inntil 
ak=fft(sp(nn)); 
plot((0:winlen-1)/(winlen/fs),20*log10(abs(ak)));