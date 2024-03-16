function [ f ] = perceptronOutput( x, w )

% Input
% -----
%
% x ... Data point.
%
% w ... Weight vector.
%       [ w_1; w_2 ]

% Output
% ------
%
% f ... Perceptron output characteristic.

% ---------------------------------
% Your implementation goes here...
f = transpose(w)*transpose(x);

if f >= 0
    f = 3;
else
    f = -1;
end
% ---------------------------------

end