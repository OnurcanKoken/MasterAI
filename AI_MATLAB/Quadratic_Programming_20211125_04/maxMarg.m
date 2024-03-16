function [exitflag, w, d, margin, dists] = maxMarg( X, y )

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
% d        ... Distance from the origin.
%
% margin   ... Margin.
%
% dists    ... Distances of each data point to the separating plane.

% given data point matrix
[m, n] = size(X);

% Q is the symmetric positive definite matrix
Q = eye(n+1);
Q(end, end) = 0;

% A*x <= b
A = [X ones(m, 1)];
A(y==1, :) = -A(y==1, :);

b = -ones(m, 1);
c = zeros(n+1, 1);

% minimize - objective
% returns final point, function value, and exitflag
[x, ~, exitflag] = quadprog(Q, c, A, b);

% the weight vector
w = x(1:n)/norm(x(1:n));

% the distance from the origin
d = x(end)/norm(x(1:n));

% the maximum margin separating plane
margin = 1/norm(x(1:n));

% distances
dists = abs(X * w + d);

end