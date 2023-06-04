% סעיף ד
N = 32;
M = 64;
B1 = 7;
B2 = 7;
x = zeros(N, M);
x(1:B1, 1:B2) = 1;

X = FFT2D(x);

% Plot the DFT
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
h0 = h(:,1);

% Pad zeros to the signal to make its length 6
padded_h0 = [h0', zeros(1, 3)]';

fft_result = fft(padded_h0);
frequencies = [0, 2*pi/6, 2*2*pi/6, 4*2*pi/6];

% Calculate the DTFT values by scaling the FFT output
dtft_values = fft_result(round(frequencies*(length(fft_result)/(2*pi)))+1);

% סעיף ו
% Define w[n]
w = zeros(1, 30);
w(1) = 1;
w(30) = 1;

% Calculate the cyclic convolution
cyclic_conv = cconv(h0, w, 32);

% Plot the result
figure;
n = 0:31;
stem(n, cyclic_conv);
xlabel('n');
ylabel('Cyclic Convolution');
title('Cyclic Convolution of h_0[n] with w[n]');

% סעיף ז
y1 = dist_image_1;
y2 = dist_image_2;

% Pad h with the right amount of zeros to match y1 and y2
h1 = imresize(h, size(y1));
h2 = imresize(h, size(y2));

% Calculate DFT
Y1 = fft2(y1);
Y2 = fft2(y2);
H1 = fft2(h1);
H2 = fft2(h2);

% Yi = Xi*Hi
X1 = Y1./H1;
X2 = Y2./H2;

% Calculate IDFT
x1 = ifft2(X1);
x2 = ifft2(X2);

% Plot the images
figure;
subplot(1, 1, 1);
imagesc(abs(x1));
title('x1');
xlabel('m');
ylabel('n');
colorbar;
colormap jet;

figure;
subplot(1, 1, 1);
imagesc(abs(x2));
title('x2');
xlabel('m');
ylabel('n');
colorbar;
colormap jet;



% סעיף ט - בונוס
h = imp_resp_image;
y2 = dist_image_2;

% Set the number of iterations
numIterations = 10000;

% Initialize the reconstructed image with the degraded image
x = y2;

% Perform Richardson-Lucy deconvolution
for iter = 1:numIterations
    % Estimate the error between the observed and estimated images
    relative_blur = y2 ./ (conv2(x, h, 'same') + eps);
    
    % Update the reconstructed image
    x = x .* (conv2(relative_blur, rot90(h, 2), 'same'));
end

% Display the reconstructed image
figure;
subplot(1, 1, 1);
imagesc(abs(x));
title('x2');
xlabel('m');
ylabel('n');
colorbar;
colormap jet;


