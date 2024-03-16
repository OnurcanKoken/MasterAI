function [exitflag, w, d, margin, dists, alphas, sv] = maxMarg05( X, y )

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
%              [ s_1; s_2; s_3; ... ]

% Output
% ------
%
% exitflag ... Exitflag of quadprog.
%
% w        ... Weight vector.
%
% d        ... Bias of Separating Plane.
%
% margin   ... Margin.
%
% dists    ... Distances of each data point to the separating plane.
%
% alphas   ... Lagrange multipliers.
%
% sv       ... Indices of support vectors.

% given data point matrix
m = size(X,1);

% quadratic objective term - symmetric matrix
H = (y' * y) .* (X * X');

% linear objective term
f = -ones(m, 1);

% linear equality constraints Aeq.x=beq
Aeq = y;
beq = 0;

% lower bounds
lb = zeros(m, 1);

% solve the quadratic programming problem
[alphas, ~, exitflag] = quadprog(H, f, [], [], Aeq, beq, lb);

% Weight vector - normalized
w = ((alphas'.*y)*X)/norm(((alphas'.*y)*X));

% Bias of Separating Plane
d = (-0.5)*(min(w*X(y == 1,:)')+max(w*X(y == -1,:)'));

% Margin
margin = 1/norm(((alphas'.*y)*X));

% Distances of each data point to the separating plane
dists = abs(w * X' + d);

% Indices of support vectors
sv = find((dists - margin) < exp(-10));
end