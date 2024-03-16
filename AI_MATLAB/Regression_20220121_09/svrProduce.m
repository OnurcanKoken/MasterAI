function f = svrProduce( X, K, alphas, alphas_dash, d, x1, x2 )
% Input
% -----
%
% X          ... Data points.
%                [ x_11, x_12;
%                  x_21, x_22;
%                  x_31, x_32;
%                  ...              ]
%
% K          ... Kernel.
%                @(x, y) ...
%
% alphas     ... Lagrange multipliers.
%
% alphas_dash... Lagrange multipliers.
%
% d          ... Distance from the origin.
%
% x1         ... Domain of x1, e.g. [-3 -2 -1 0 1 2 3].
%
% x2         ... Domain of x2, e.g. [-3 -2 -1 0 1 2 3].

% Output
% ------
%
% f          ... Approximated values of f(x) on the domain(s) of x1 and x2.

[n, ~] = size(X);

if(isempty(x2))
    f = zeros(length(x1), 1);
    for i = 1:length(x1)
        f(i) = d;
        for k = 1:n
            f(i) = f(i) + (alphas(k) - alphas_dash(k)) * K(x1(i), X(k, :));
        end
    end
else
    f = zeros(length(x1), length(x2));
    for i = 1:length(x1)
        for j = 1:length(x2)
            f(i, j) = d;
            for k = 1:n
                f(i, j) = f(i, j) + (alphas(k) - alphas_dash(k)) * K([x1(i) x2(j)], X(k, :));
            end
        end
    end
end

end