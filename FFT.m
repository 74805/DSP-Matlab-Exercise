function [X] = FFT(x)
N = length(x); % Assume N is a power of 2
if N == 1
    X = x;
    return;
end

Even = FFT(x(1:2:N-1));
Odd = FFT(x(2:2:N));

k = 0:N-1;
L = N/2;
omega = exp(-2*pi*1i/N);
X = Even(mod(k, L) + 1) + omega.^k.*Odd(mod(k, L) + 1);
end