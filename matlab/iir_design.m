% IIR Filter Design in MATLAB
Fs = 1000;  
Fc = 100;  
N = 2;      
type = 'low';  

[b, a] = butter(N, Fc/(Fs/2), type);


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
    fprintf(fid, '%s\n', binary_coeff); 
end
fclose(fid);

freqz(b, a, 1024, Fs);

