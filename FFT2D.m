function [X] = FFT2D(x)
[N, M] = size(x); % Size of the 2D input signal
X = zeros(N, M); % Initialize the output matrix

% Calculate 1D DFT for each column
for m = 1:M
    X(:, m) = FFT(x(:, m));
end

% Calculate 1D DFT for each row
for n = 1:N
    X(n, :) = FFT(X(n, :));
end
end