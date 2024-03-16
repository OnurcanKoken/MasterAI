clear all;
close all;
clc;

% Load Data.
load('10mat.mat');

% Initialize Grid.
x1 = -5:0.02:5;
x2 = -5:0.02:5;
G = zeros(length(x1), length(x2));

%--------------------------------------------------------------------------
% Calculate classification results on Grid.
% YOUR IMPLEMENTATION GOES HERE...

% calculate the prediction
y_pred = classification(X, g, g_bias, h, h_bias)';
inp1 = X(y_pred == 1, 1);
inp2 = X(y_pred == 1, 2);

% calculate results on Grid
for i = 1:length(x1)
    for j = 1:length(x2)
        G(i,j) = classification([x1(i), x2(j)], g, g_bias, h, h_bias); 
    end
end

%--------------------------------------------------------------------------
% Plot given data and classification results.
figure(1);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
set(gcf, 'PaperOrientation', 'landscape');
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 29.7 21]);
set(gcf, 'PaperSize', [29.7 21.0]);
subplot(1, 2, 1);
plot(X(y ==  1, 1), X(y ==  1, 2), 'kx', 'MarkerSize', 15); hold on;
plot(X(y == 0, 1), X(y == 0, 2), 'k+', 'MarkerSize', 15);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Given data', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-5.1 5.1]);
ylim([-5.1 5.1]);
legend('1', '0', 'Location', 'NorthEast') 
subplot(1, 2, 2);
surface(x1, x2, G', 'EdgeColor', 'none');
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Classification results', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-5 5]);
ylim([-5 5]);
colormap([0.75 0.75 0.75; 0.25 0.25 0.25]);
colorbar('YTick', [0.25 0.75], 'YTickLabel', {' 0', ' 1'}, 'FontSize', 14, 'FontWeight', 'bold');

print('-dpng', '1.png', '-r150');