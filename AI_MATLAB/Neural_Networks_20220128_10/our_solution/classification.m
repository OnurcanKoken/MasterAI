function [y] = classification( X, g, g_bias, h, h_bias )
% Input
% -----
%
% X                 ... Data point.
%                       [ x_1, x_2, x_3]
%
% g,h               ... weigths of layers.
%                       [ w_11, w_12, w_13, 
%                         w_21, w_22   ... ]
%
% g_bias, h_bias    ... bias of layers.
%                       [ b_1, b_2, ... ]

% Output
% ------
%
% y                 ... Network output.
%

gg = X * g + g_bias;
% apply sigmoid activation function
G = (1./(1+exp(-gg)));
G(G<0.5) = 0;
hh = G * h + h_bias;
% apply sigmoid activation function
y = (1./(1+exp(-hh)));
% classification
y(y<0.5) = 0;
y(y>=0.5) = 1;

end