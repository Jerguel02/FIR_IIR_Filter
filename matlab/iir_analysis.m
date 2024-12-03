% IIR Filter Analysis
Fs = 1000;         % Sampling frequency
t = 0:1/Fs:1;      % Time vector
input_signal = sin(2*pi*50*t) + 0.5*sin(2*pi*300*t); % Input signal (50Hz + 300Hz)

% Design IIR low-pass filter using Butterworth filter
N = 2;  % Filter order
Fc = 100;  % Cutoff frequency
[b, a] = butter(N, Fc/(Fs/2), 'low');  % Butterworth filter coefficients

% Filter the signal using the IIR filter
filtered_signal = filter(b, a, input_signal);

% Plot results
figure;

subplot(2,1,1);
plot(t, input_signal);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filtered_signal);
title('Filtered Signal (IIR)');
xlabel('Time (s)');
ylabel('Amplitude');
