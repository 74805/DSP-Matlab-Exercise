
% Load the audio file
[audioSignal, sampleRate] = audioread('audioFile.wav');
% Resample the audio signal
audioSignal = resample(audioSignal, 16000, sampleRate);
% Cut signal
N = 2^16;
audioSignal = audioSignal(1:N);

x = audioSignal;
%soundsc(x, 16000);

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
%soundsc(y, 16000);
% ההקלטה נשמעת חלשה מאוד ועם הרבה רעש ברקע
