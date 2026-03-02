clear; close all; clc; 
% Parameters 
xMin   = 0;        % lower bound of x 
xMax   = 10;       % upper bound of x 
Nx     = 2000;     % number of samples 
orders = 0:5;      % Bessel orders 
% x-axis 
x = linspace(xMin, xMax, Nx); 
% Figure 
figure('Color','w','Name','Bessel J0..J5');  
hold on; grid on; box on; 
 
lw = 2;            % line width 
for n = orders 
    plot(x, besselj(n, x), 'LineWidth', lw, ... 
        'DisplayName', sprintf('J_{%d}(x)', n)); 
end 
% Reference line 
yline(0, 'k--', 'LineWidth', 1); 
% Labels and formatting 
title('Bessel Functions $J_0(x)$ to $J_5(x)$', 'Interpreter', 'latex'); 
xlabel('$x$', 'Interpreter', 'latex'); 
ylabel('$J_n(x)$', 'Interpreter', 'latex'); 
legend('Location','northeastoutside'); 
xlim([xMin xMax]); 