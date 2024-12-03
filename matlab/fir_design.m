% FIR Filter Design in MATLAB
Fs = 1000;  % Sampling frequency
Fc = 100;   % Cutoff frequency
N = 50;     % Filter order

% Design low-pass FIR filter
coeff = fir1(N, Fc/(Fs/2), 'low');
coeff_fixed = round(coeff * 2^15); % Scale to fixed-point

% Save coefficients to file
fid = fopen('coeff_fir.txt', 'w');
for i = 1:length(coeff_fixed)
    binary_coeff = dec2bin(coeff_fixed(i), 16);
    fprintf(fid, '%s\n', binary_coeff);
end
fclose(fid);

% Plot frequency response
freqz(coeff, 1, 1024, Fs);
