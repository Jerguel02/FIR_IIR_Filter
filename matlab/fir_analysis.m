% FIR Filter Analysis
Fs = 1000;         % Sampling frequency
t = 0:1/Fs:1;      % Time vector
input_signal = sin(2*pi*50*t) + 0.5*sin(2*pi*300*t); % Input signal

% Load coefficients
coeff = fir1(50, 100/(Fs/2), 'low');

% Filter the signal
filtered_signal = filter(coeff, 1, input_signal);

% Plot results
figure;
subplot(2,1,1);
plot(t, input_signal);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, filtered_signal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
