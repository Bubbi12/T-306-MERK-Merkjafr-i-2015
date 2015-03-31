function  task1to4(fs,n,xn1,xn2,xn3)

% --------- Li�ur 1. ---------
figure('name','Li�ur 1','NumberTitle','off')
subplot(3,1,1)
stem(n,xn1)
title('x1[n]');
xlabel('Stak [n]');
ylabel('�tslag');

subplot(3,1,2)
stem(n,xn2)
title('x2[n]');
xlabel('Stak [n]');
ylabel('�tslag');

subplot(3,1,3)
stem(n,xn3)
title('x3[n]');
xlabel('Stak [n]');
ylabel('�tslag');


% --------- Li�ur 2. ---------

p = 0.4;
soundsc(xn1,fs)
pause(p)
soundsc(xn2,fs)
pause(p)
soundsc(xn3,fs)
pause(p)

waitforbuttonpress;

% --------- Li�ur 3. ---------

xn = xn1 + xn2 + xn3;
soundsc(xn,fs)
figure('name','Li�ur 3','NumberTitle','off')
stem(n,xn)
title('x[n] = x1[n] + x2[n] + x3[n]');
xlabel('Stak [n]');
ylabel('�tslag');


% --------- Li�ur 4. ---------

figure('name','Li�ur 4: Fourier v�rpun merkjanna','NumberTitle','off')
lenn = length(n);
subplot(3,1,1)
plot((0:lenn-1)/(lenn/fs),fft(xn1));
title('F[x1]');
xlabel('T��ni [Hz]');
ylabel('Gildi');
hold on


subplot(3,1,2)
stem((0:lenn-1)/(lenn/fs),20*log10(abs(fft(xn2))));
title('F[x2]');
xlabel('T��ni [Hz]');
ylabel('Gildi');

subplot(3,1,3)
stem((0:lenn-1)/(lenn/fs),20*log10(abs(fft(xn3))));
title('F[x3]');
xlabel('T��ni [Hz]');
ylabel('Gildi');
end

