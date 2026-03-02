
clear; clc; close all; 
 
xMin = 0; xMax = 16; Nx = 3200; 
Nzeros = 6; 
 
x  = linspace(xMin, xMax, Nx); 
J0 = besselj(0, x); 
 
J0fun = @(z) besselj(0, z); 
z = zeros(1, Nzeros); 
for k = 0:Nzeros-1 
    a = k*pi + 1e-6; 
    b = (k+1)*pi - 1e-6; 
    z(k+1) = fzero(J0fun, [a b]); 
end 
 
set(groot,'defaultTextInterpreter','latex'); 
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaultLegendInterpreter','latex'); 
 
figure('Color','w','Units','pixels','Position',[220 120 850 500]); 
ax = gca; hold(ax,'on'); grid(ax,'on'); box(ax,'on'); 
ax.FontName = 'Times New Roman'; ax.FontSize = 12; ax.LineWidth = 1.0; 
 
% Plot J0 and y=0 
plot(x, J0, 'LineWidth', 2.0, 'Color', [0 0.2 0.8], 'DisplayName', '$J_0(x)$'); 
yline(0,'k--','LineWidth',0.8,'HandleVisibility','off'); 
 
% Zeros 
plot(z, zeros(size(z)), 'o', 'MarkerSize',6.5, 'LineWidth',1.2, ... 
    'MarkerFaceColor',[0.85 0.15 0.15], 'MarkerEdgeColor',[0.55 0.1 0.1], ... 
    'DisplayName','Zeros of $J_0$'); 
% Highlight the first zero (≈ 2.4048) 
plot(z(1), 0, 'p', 'MarkerSize',11, 'LineWidth',1.6, ... 
    'MarkerFaceColor',[0.95 0.55 0.15], 'MarkerEdgeColor',[0.75 0.35 0.05], ... 
    'DisplayName','$B=2.4048$ (first zero)'); 
% Label the zeros 
for i = 1:numel(z) 
    text(z(i)+0.12, 0.06, sprintf('%.4f', z(i)), ... 
        'FontSize',10, 'Color',[0.4 0 0], 'Interpreter','none'); 
end 
 
title('$J_0(x)$ and its zeros'); 
xlabel('$x$'); ylabel('$J_0(x)$'); 
legend('Location','best'); 
xlim([xMin xMax]); 
ylim([-0.5 1.05]); 