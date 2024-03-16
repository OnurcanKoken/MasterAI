function [ w, iter, exitflag ] = perceptronPBPL( X, w, eta, maxIter )

% Input
% -----
%
% X        ... Data points and class labels.
%              [ x_11, x_12, s_1;
%                x_21, x_22, s_2;
%                x_31, x_32, s_3;
%                ...              ]
%
% w        ... Initial weight vector.
%              [ w_1; w_2 ]
%
% eta      ... Step size.
%
% maxIter  ... Maximum number of iterations.

% Output
% ------
%
% w        ... Final weight vector.
%
% iter     ... Number of iterations needed.
%
% exitflag ... Exit flag.
%              0 = No solution found, maximum number of iterations reached.
%              1 = Solution found.

% Determine number of data points.
n = size(X, 1);

% Initialize iteration counter, exit condition and exit flag.
iter     = 0;
exit     = 0;
exitflag = 0;

% While exit condition not met... 
while ((~exit) && (iter < maxIter))
    % Increment iteration counter.
    iter = iter + 1;
    % ---------------------------------
    % Your implementation goes here...
    repeat_step = 0; 
    for i = 1:n
        f = perceptronOutput(X(i,1:2), w);
        d_i = (X(i, 3) - f)^2;
        if d_i > 0
            % update w
            w = w + eta*(X(i,3) - f)*transpose(X(i, 1:2));
            % repeat the iteration
            repeat_step = 1;
        end
    end

    if repeat_step == 0
        exitflag = 1; % Solution found
        exit = 1;
    end
    % ---------------------------------
end

end