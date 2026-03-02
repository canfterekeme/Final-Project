clear; clc; close all; 
 
Fs = 10e6;             
fm = 10e3;            
fc = 100e3;            
beta = 2.4048;        
T = 10 / fm;           
t = 0:1/Fs:T;         
 
phi3 = cos(2*pi*fc*t + beta*sin(2*pi*fm*t)); 
 
f_message = 10000:1000:14000;  % Users from 10kHz to 14kHz 
 
cmap = [ 
    0.00, 0.45, 0.74;  % Standard Blue 
    0.85, 0.33, 0.10;  % Orange/Red 
    0.93, 0.69, 0.13;  % Dark Yellow/Gold 
    0.49, 0.18, 0.56;  % Purple 
    0.47, 0.67, 0.19;  % Green 
]; 
 
figure('Color', 'w', 'Position', [100, 100, 1200, 600]); 
hold on; 
 
for u = 1:length(f_message) 
    fm_current = f_message(u); 
     
    % Generate FM signal 
    signal = cos(2*pi*fc*t + beta*sin(2*pi*fm_current*t)); 
     
    % Calculate FFT 
    NFFT = 2^16; 
    spectrum = fftshift(fft(signal, NFFT)); 
    f_axis = linspace(-Fs/2, Fs/2, NFFT); 
     
    % Plot Magnitude 
    color_idx = mod(u-1, size(cmap,1)) + 1;  
    plot(f_axis/1000, abs(spectrum), ... 
         'Color', cmap(color_idx,:), ... 
'LineWidth', 1.5); 
end 
xline(fc/1000, '--k', 'Carrier (fc)', 'LineWidth', 1.5, 'LabelVerticalAlignment', 'top'); 
xlabel('Frequency (kHz)', 'FontSize', 12, 'FontWeight', 'bold'); 
ylabel('Magnitude', 'FontSize', 12, 'FontWeight', 'bold'); 
title(sprintf('Multi-User FM Spectrum (fc=%d kHz, Modulation Index=%.4f)', fc/1000, beta), ... 
'FontSize', 14); 
xlim_min = (fc - 4*max(f_message))/1000; 
xlim_max = (fc + 4*max(f_message))/1000; 
xlim([xlim_min xlim_max]); 
grid on; box on; 
legend_labels = cell(length(f_message), 1); 
for u = 1:length(f_message) 
legend_labels{u} = sprintf('User %d (f_u = %d kHz)', u, f_message(u)/1000); 
end 
legend(legend_labels, 'Location', 'northeast', 'FontSize', 10);