clear all; close all; clc

load signal.mat fs Rx T bps f0 f1

time = length(Rx)/fs;%tímalengd merkisins..er það ekki?
bits = time/(T); %264 bits
symbols = bits/bps; %66 merki -> 66 stafir


% ------------- 2.1 Teiknun -------------

figure('Name','Merkið teiknað - 2.1')
plot(linspace(0,time,length(Rx)),Rx);

% ------------- 2.2 Greining -------------
 % bara einhver útskýring á gögnunum
% ------------- 2.2.1 Útreikn á rófi -------------
m=1;
K =1024;
nn=@(m) (1:(fs*T))+(m-1)*fs*T;        %vísivigur - pointing vector?
F=fft(Rx(nn(1)),K);                   %fourier af hluta merkisins
% ------------- 2.2.2 Tíðniróf teiknað -------------
% ------------- 2.2.3 Annar ramminn greindur -------
x_ax = 1:K/2;
x_ax_freq = x_ax*fs/K;

figure('Name','Tíðniróf teiknið')
%fyrir m = 1
subplot(2,1,m)
plot(x_ax_freq,abs(F(x_ax)))
title('Fouriervörpun af fyrsta ramma Rx');
xlabel('Tíðni [Hz]');
ylabel('Magnutide');

%fyrir m = 2
m=2;
F=fft(Rx(nn(m)),K);
subplot(2,1,m)
plot(x_ax_freq,abs(F(x_ax)))
title('Fouriervörpun af öðrum ramma Rx');
xlabel('Tíðni [Hz]');
ylabel('Magnutide');

% ------------- 2.2.4 Greining -------------
%mheeeeee
%% ------------- 2.3 Finna tíðnir -------------
% ------------- 2.3.1 Tíðnigildi toppsins -----
% sjá fallið 'findFrequencyPeak'.m
% ------------- 2.3.2 Allir rammar -------------
fmax = (1:bits);
for m = 1:bits
    fmax(m) = findFrequencyPeak(Rx(nn(m)),fs,K);
end

% c = [0 zeros(1,bits-1)+bits];
% fmax = fmax+cumsum(c);

% ------------- 2.3.3 Teiknum -------------
stem(1:bits,fmax);
% ------------- 2.4 Afkóðun -------------
signal_bits = (fmax<1300 & fmax>1100); %ones og zeros.. nú bara lesa út úr þessu með eh

% ------------- 2.4.1 Finnum bitastrauminn -------------

% ------------- 2.3.2 Bitum breytt í tákn -------------

letter = [' ' 'A' 'K' 'D' 'E' 'G' 'H' 'I' 'L' 'M' 'N' 'O' 'R' 'S' 'T' 'U'];
for i = 1:symbols
   anss = find(bin2dec(num2str(signal_bits((i-1)*4+1:(i*4))))+1 == 1:16);
   lett = letter(anss);
   fprintf('%c',lett)
end
fprintf('\n')
    






