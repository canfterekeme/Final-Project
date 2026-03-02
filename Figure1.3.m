clear; clc; close all; 
 
% Parameters 
T = 1; 
K = 5; 
beta = 2.4048; 
N = 5000; 
t = linspace(0, T, N); 
 
% Text rendering (paper look) 
set(groot,'defaultTextInterpreter','latex'); 
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaultLegendInterpreter','latex'); 
 
% Figure 
 
44 
 
figure('Color','w','Units','centimeters','Position',[3 3 16 10]); 
ax = gca; hold(ax,'on'); grid(ax,'on'); box(ax,'on'); 
ax.FontName = 'Times New Roman'; 
ax.FontSize = 10; 
ax.LineWidth = 1.0; 
 
% User curves 
cols = lines(K); 
for u = 1:K 
    f = (beta*u).*cos(2*pi*u*t/T); 
    plot(t, f, 'LineWidth', 1.5, 'Color', cols(u,:)); 
    text(T, f(end), sprintf('  User %d', u), ... 
        'FontName','Times New Roman','FontSize',9,'FontWeight','bold', ... 
        'Color', cols(u,:)); 
end 
 
% Carson limit (for the highest user) 
L = K*(beta + 1); 
yline(L,  '--k', 'LineWidth', 1.2); 
yline(-L, '--k', 'LineWidth', 1.2); 
 
% Reference line 
yline(0, '-', 'Color', [0.7 0.7 0.7], 'LineWidth', 0.6); 
 
% Labels 
xlabel('Normalized time ($t/T$)', 'FontSize', 11); 
ylabel('Normalized frequency ($f\cdot T$)', 'FontSize', 11); 
title('Instantaneous frequency trajectories and Carson bandwidth limit', 'FontSize', 12); 
 
xlim([0 T]); 
ylim([-(L+5) (L+5)]); 
 
text(0.02*T, L + 1.2, sprintf('Carson limit: $\\pm %.2f/T$', L), ... 
    'FontSize', 9, 'FontWeight', 'bold');