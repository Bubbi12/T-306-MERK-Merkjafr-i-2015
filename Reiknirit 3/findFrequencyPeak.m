function fmax = findFrequencyPeak(frame,fs,K)
%l�t inn R(nn(m)) og fs
frame = abs(fft(frame,K));
fmax = find(max(frame) == frame)*fs/K;
fmax = fmax(1);
end

