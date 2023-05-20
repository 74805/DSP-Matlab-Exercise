function [output] = FFT(input)
N = length(input); % Assume N is a power of 2
if N == 1
    output = input;
    return;
end

Even = FFT(input(2:2:N));
Odd = FFT(input(1:2:N-1));

k = 0:N-1;
L = N/2;
omega = exp(2*pi*1i/N);
output = Even(mod(k, L) + 1) + omega.^k.*Odd(mod(k, L) + 1);
end