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

% define Sigmoid Activation Function
f = @(x) 1./(1+exp(-x));

% first/input layer
layer1 = f(X*g+g_bias);

% output layer
layer2 = f(layer1*h+h_bias);

% make binary output
y = round(layer2);

end