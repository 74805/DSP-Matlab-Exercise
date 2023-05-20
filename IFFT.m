function [x] = IFFT(X)
N = length(X);
x = 1/N*conj(FFT(conj(X)));
end