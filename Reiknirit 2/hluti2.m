%%
clear all; clc; close all;

load corruptedspeech.mat fs sp

% ----------- Tal í suði 2.1 -----------

figure
nshift=50000;%Tímahliðrun 
winlen=1024;%ca23ms@fs=44100 
nn=(1:winlen)+nshift;%Tímaindexbúinntil 
ak=fft(sp(nn)); 
plot((0:winlen-1)/(winlen/fs),20*log10(abs(ak)));
xlabel('Tíðni[Hz]')
ylabel('Útslag[dB]')

%% ----------- Hönnun sía 2.2 -----------

% ----------- IIR 2.2 -----------

fnyq=fs/2;%Nyquistfrequency 
Rp=0.3;%Maximumrippleinthepassband 
Rs=60;%Maximumrippleinthestopband upprunaleg 60
N1=8;%Degreeoffiler  uppr 4
fc=3000;%Cut-offfrequency
[b1,a1]=ellip(N1,Rp,Rs,fc/fnyq,'low');

% ----------- FIR 2.2 -----------

 f=[0 fc fc fnyq]/fnyq;
 m=[1 1 0 0];
 N2=60; %Degreeoffilter 
 b2=fir2(N2,f,m); a2=1;

 % ----------- Tíðnisvaranir síanna 2.2 -----------
 figure
 % ----------- Freq response 2.2 -----------
 subplot(2,1,1)
 nfft=1024;
 [H1,w1]=freqz(b1,a1,nfft);
 [H2,w2]=freqz(b2,a2,nfft);
 plot(fs*w1/(2*pi),20*log10(abs(H1)),'b');
 hold on;
 plot(fs*w2/(2*pi),20*log10(abs(H2)),'r');
 grid on;
 legend('H','H2');
 xlabel('Tíðni[Hz]')
 ylabel('Útslag[dB]')
  % ----------- Phase response 2.2 -----------
 subplot(2,1,2)
 [phiFIR,w1_p] = phasez(b1,a1,nfft); 
 [phiIIR,w2_p] = phasez(b2,a2,nfft); 
 
 plot(fs*w1_p/(2*pi),unwrap(phiFIR),'b');
 hold on
 plot(fs*w2_p/(2*pi),unwrap(phiIIR),'r');
 legend('H','H2');
 xlabel('Tíðni[Hz]')
 ylabel('Radíanar')
 grid on
 
 % ----------- Impúls síanna 2.2 -----------
 
 figure
 d=zeros(1,120);
 d(1)=1;
 h1=filter(b1,a1,d);
 h2=filter(b2,a2,d);
 plot(h1);
 hold on;
 plot(h2,'r');
 legend('h1','h2');
 
  %% ----------- síun  2.3 -----------
  figure
  subplot(3,1,1)
  
  IIR = filter(b1,a1,sp);
  soundsc(IIR,fs)
  plot((0:length(sp)-1)/(fs),IIR,'r')
  title('IIR filter');
  xlabel('Tími [s]');
  ylabel('Útslag');

  subplot(3,1,2)
  
  FIR = filter(b2,a2,sp);
  soundsc(FIR,fs)
  plot((0:length(sp)-1)/(fs),FIR,'r')
  title('FIR filter');
  xlabel('Tími [s]');
  ylabel('Útslag');

  subplot(3,1,3)
  
  plot((0:length(sp)-1)/(fs),(sp));
  title('Upprunalega merkið');
  xlabel('Tími [s]');
  ylabel('Útslag');
  
  
  
  
  
  
  
 