function  task1to4(fs,n,xn1,xn2,xn3)

% --------- Liður 1. ---------

subplot(3,1,1)
stem(n,xn1)

subplot(3,1,2)
stem(n,xn2)

subplot(3,1,3)
stem(n,xn3)

% --------- Liður 2. ---------

p = 0.4;
soundsc(xn1,fs)
pause(p)
soundsc(xn2,fs)
pause(p)
soundsc(xn3,fs)
pause(p)

% --------- Liður 3. ---------

xn = xn1 + xn2 + xn3;
soundsc(xn,fs)
figure
stem(n,xn)

% --------- Liður 4. ---------

figure
subplot(3,1,1)
stem(n,abs(fftshift(fft(xn1))))

subplot(3,1,2)
stem(n,abs(fftshift(fft(xn2))))

subplot(3,1,3)
stem(n,abs(fftshift(fft(xn3))))

end

