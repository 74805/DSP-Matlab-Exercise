% Load the audio file
[audioSignal, sampleRate] = audioread('audioFile.wav');
% Resample the audio signal
audioSignal = resample(audioSignal, 16000, sampleRate);
% Cut signal
N = 2^16;
audioSignal = audioSignal(1:N);

x = audioSignal;


% סעיף א
Px = (1/N) * sum(x.^2);
