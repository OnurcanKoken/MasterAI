function [alphas, idx] = maxMarg06( X, y, K )
% Input
% -----
%
% X        ... Data points and class labels.
%              [ x_11, x_12;
%                x_21, x_22;
%                x_31, x_32;
%                ...              ]
%
% y        ... Class labels.
%              [ s_1, s_2, s_3, ... ]
%
% K        ... Kernel.
%              @(x, y) ...

% Output
% ------
%
% alphas   ... Lagrange multipliers.
%
% idx      ... Indices of non-zero alphas.

% given data point matrix
m = size(X,1);

% quadratic objective term - symmetric matrix
% Kernel
H = zeros(m,m);
for i = 1:m
    for j = 1:m
        H(i,j) = (y(i)*y(j)).*K(X(i, :), X(j, :));
    end
end

% linear objective term
f = -ones(m, 1);

% linear equality constraints Aeq.x=beq
Aeq = y;
beq = 0;

% lower bounds
lb = zeros(m, 1);
% upper bounds 
ub = 1000 * ones(m,1);

% solve the quadratic programming problem
% alphas -> Lagrange multipliers
alphas = quadprog(H, f, [], [], Aeq, beq, lb, ub);

% Indices of non-zero alphas
idx = abs(alphas) > exp(-10);

end