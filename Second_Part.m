Fs = 16000;
N = 2^16;

% Load the audio file
[audioSignal, sampleRate] = audioread('audioFile.wav');
% Resample the audio signal
audioSignal = resample(audioSignal, Fs, sampleRate);
% Cut signal
audioSignal = audioSignal(1:N);

x = audioSignal;
%soundsc(x, Fs);

% סעיף א
Px = (1/N) * sum(x.^2);

% סעיף ב
d1 = 3;
d2 = 2; % Took the second digit

% Define z[n]
n = 1:N;
w1 = 1.6+0.1*d1;
w2 = 1.6+0.1*d2;
w3 = 3;
z = 50*sqrt(Px)*(cos(w1*n)+cos(w2*n)+cos(w3*n));

% Define y[n]
y = x + z;
%soundsc(y, Fs);
% ההקלטה נשמעת חלשה מאוד ועם הרבה רעש ברקע

% סעיף ג
% Plot y[n]
figure;
plot(n, y);
xlabel('n');
ylabel('y');
title('y[n]');

% סעיף ד
omega = -pi:2*pi/128:pi;
Y = exp(-1i*omega'*n)  * y.';

% Plot Y[e^(jw)] (one cycle)
figure;
plot(omega, abs(Y));
xlabel('w');
ylabel('Y');
title('Y[e^j^w]');

% סעיף ה
z2 = downsample(z, 2);

% DTFT:
n=1:N/2;
Z2 = exp(-1i*omega'*n)  * z2.';
