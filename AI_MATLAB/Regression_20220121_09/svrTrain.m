function [alphas, alphas_dash, d] = svrTrain( X, y, K, epsilon, C )
% Input
% -----
%
% X          ... Data points.
%                [ x_11, x_12;
%                  x_21, x_22;
%                  x_31, x_32;
%                  ...              ]
%
% y          ... Class labels.
%                [ s_1; s_2; s_3; ... ]
%
% K          ... Kernel.
%                @(x, y) ...
%
% epsilon    ... SVR parameter.
%
%
% C          ... SVR parameter.

% Output
% ------
%
% alphas     ... Lagrange multipliers.
%
% alphas_dash... Lagrange multipliers.
%
% d          ... Distance from the origin.

[n, ~] = size(X);

Xnew = zeros(n);
for i = 1:n
    for j = 1:n
        Xnew(i, j) = K(X(i, :), X(j, :));
    end
end

Q = [Xnew -Xnew; -Xnew Xnew];

c = zeros(2*n, 1);
for i = 1:2*n
    if i <= n
        c(i) = epsilon - y(i);
    else
        c(i) = epsilon + y(i-n);
    end
end

A = [-eye(2*n); eye(2*n)];
b = [zeros(2*n, 1); C*ones(2*n, 1)];

Aeq = [ones(1, n) -1*ones(1, n)];
beq = 0;

alphas = quadprog (Q, c, A, b, Aeq, beq);

alphas_dash = alphas(n+1:end);
alphas = alphas(1:n);

d_i = zeros(n,1);
for j = 1:n
    d_temp = 0;
    for i = 1:n
        d_temp = d_temp + (alphas(i) - alphas_dash(i)) * K(X(i, :), X(j, :));
    end
    
    if abs(alphas(j)) > exp(-8)
        d_i(j) = y(j) - d_temp - epsilon;
    elseif abs(alphas_dash(j)) > exp(-3)
        d_i(j) = y(j) - d_temp + epsilon;
    end
end
d_j_idx = d_i(abs(d_i)>exp(-8));
d = mean(d_j_idx, 1);

end