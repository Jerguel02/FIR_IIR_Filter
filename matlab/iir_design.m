% IIR Filter Design in MATLAB
Fs = 1000;  % Sampling frequency
Fc = 100;   % Cutoff frequency
N = 2;      % Filter order (bậc của bộ lọc)
type = 'low';  

% Design a low-pass Butterworth filter
[b, a] = butter(N, Fc/(Fs/2), type);

% Chuyển hệ số sang kiểu fixed-point (16 bit)
b_fixed = round(b * 2^15);  % Scale to fixed-point
a_fixed = round(a * 2^15);  % Scale to fixed-point

% Save coefficients to file
fid = fopen('coeff_iir.txt', 'w');
fprintf(fid, 'b coefficients:\n');
for i = 1:length(b_fixed)
    binary_coeff = dec2bin(b_fixed(i), 16);
    fprintf(fid, '%s\n', binary_coeff);
end

fprintf(fid, '\na coefficients:\n');
for i = 1:length(a_fixed)
    binary_coeff = dec2bin(a_fixed(i), 16);
    fprintf(fid, '%s\n', binary_coeff);  % Write a coefficients in binary format
end
fclose(fid);

% Plot frequency response
freqz(b, a, 1024, Fs);

