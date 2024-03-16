clear all;
close all;
clc;

% Load data.
load('06.mat');

% Set up kernel.
K = @(x, y) (x*y')^2;

% Call dual QP with kernel.
[alphas, idx] = maxMarg06( X, y, K );

% Consider only data points corresponding to non-zero alphas.
alphas_idx = alphas(idx);
X_idx = X(idx, :);
y_idx = y(idx);

% Initialize average d_0.
d_0 = 0;

% Initialize G(x) and grid.
x1 = -1:0.02:1;
x2 = -1:0.02:1;
G = zeros(length(x1), length(x2));

% Calculate average d_0.
% YOUR IMPLEMENTATION GOES HERE...
% initialize d
d = zeros(size(alphas_idx));
for j = 1:size(alphas_idx)
    d_sum = 0;
    for i = 1:size(alphas_idx)
        % here alphas_idx is already non-zero, no need to check 
        d_sum = d_sum + alphas_idx(i)*y_idx(i)*K(X_idx(i,:),X_idx(j,:));   
    end
    d(j) = (1/(y(j))) - d_sum;
end
d_0 = mean(d); % d average

% Calculate G(x) on grid.
% YOUR IMPLEMENTATION GOES HERE...
% Classification rule/function G(u)
for i = 1:length(x1)
    for j = 1:length(x2)
        G(i,j) = d_0;
        for k = 1:size(alphas_idx)
            G(i,j) = G(i,j) + alphas_idx(k)*y_idx(k)*K([x1(i) x2(j)], X_idx(k,:));
        end
        G(i,j) = sign(G(i,j));
    end
end

% Plot given data and classification results.
figure(1);
set(gcf, 'Units', 'normalized', 'OuterPosition', [0.05 0.05 0.9 0.9]);
set(gcf, 'PaperOrientation', 'landscape');
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 29.7 21]);
set(gcf, 'PaperSize', [29.7 21.0]);
subplot(1, 2, 1);
plot(X(y ==  1, 1), X(y ==  1, 2), 'k+', 'MarkerSize', 15); hold on;
plot(X(y == -1, 1), X(y == -1, 2), 'kx', 'MarkerSize', 15);
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Given data', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1.1 1.1]);
ylim([-1.1 1.1]);
legend('+1', '- 1', 'Location', 'NorthEast') 
subplot(1, 2, 2);
surface(x1, x2, G, 'EdgeColor', 'none');
xlabel('x_1', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('x_2', 'FontSize', 14, 'FontWeight', 'bold');
title('Classification results', 'FontSize', 14, 'FontWeight', 'bold');
set(gca, 'FontSize', 14, 'FontWeight', 'bold');
axis equal;
xlim([-1 1]);
ylim([-1 1]);
colormap([0.75 0.75 0.75; 0.25 0.25 0.25]);
colorbar('YTick', [-0.5 0.5], 'YTickLabel', {' - 1', ' +1'}, 'FontSize', 14, 'FontWeight', 'bold');

print('-dpng', '1.png', '-r150');