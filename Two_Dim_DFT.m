function [X] = Two_Dim_DFT(x)
%TWO_DIM_DFT gets a two-dimentional signal x and returns its DFT 

% Xn = FFT(x) only by columns
Xn = FFT(x);

% X = FFT(Xn) by n
X = FFT(Xn.').'; % Transpose the result and apply FFT along the columns; 
end

