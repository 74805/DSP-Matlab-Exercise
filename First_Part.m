% סעיף ד
N = 32;
M = 64;
B1 = 7;
B2 = 7;
x = zeros(N, M);
x(1:B1, 1:B2) = 1;

X = FFT2D(x);

Plotting the DFT
figure;
subplot(1, 1, 1);
imagesc(abs(X));
title('2-Dimensional DFT');
xlabel('k2');
ylabel('k1');
colorbar;
colormap jet;

% run in command line: [dist_image_1,dist_image_2,noised_image,imp_resp_image]=img_gen(input1,input2);
% סעיף ה
h = imp_resp_image;
h0 = h(:,1)

% Pad zeros to the signal to make its length 6
padded_h0 = [h0', zeros(1, 3)]'

fft_result = fft(padded_h0);
frequencies = [0, 2*pi/6, 2*2*pi/6, 4*2*pi/6];

% Calculate the DTFT values by scaling the FFT output
dtft_values = fft_result(round(frequencies*(length(fft_result)/(2*pi)))+1)



