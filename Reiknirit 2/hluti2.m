%%
clear all; clc; close all;

load corruptedspeech.mat fs sp

% ----------- Tal í suði 2.1 -----------
nshift=50000;%Tímahliðrun 
winlen=1024;%ca23ms@fs=44100 
nn=(1:winlen)+nshift;%Tímaindexbúinntil 
ak=fft(sp(nn)); 
plot((0:winlen-1)/(winlen/fs),20*log10(abs(ak)));