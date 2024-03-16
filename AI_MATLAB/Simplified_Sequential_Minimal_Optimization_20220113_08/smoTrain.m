function [alphas, idx, d] = smoTrain( X, y, K, C, eps, maxIter )
% Input
% -----
%
% X        ... Data points.
%              [ x_11, x_12;
%                x_21, x_22;
%                x_31, x_32;
%                ...              ]
%
% y        ... Class labels.
%              [ s_1; s_2; s_3; ... ]
%
% K        ... Kernel.
%              @(x, y) ...
%
% C        ... SVM hyperparameter.
%
% eps      ... User-defined epsilon.
%
% maxIter  ... Maximum number of iterations.

% Output
% ------
%
% alphas   ... Lagrange multipliers.
%
% idx      ... Indices of non-zero alphas.
%
% d        ... Parameter d.

% data points X
[n, ~] = size(X);

% initialize the parameters
alphas = zeros(n, 1);
d = 0;
num_it = 0;
kkt = 0;

% initialize kernel matrix
KM = zeros(n);
for i = 1:n
    for j = 1:n
        KM(i, j) = K(X(i, :), X(j, :));
    end
end

while (num_it < maxIter) && (kkt == 0)
    num_it = num_it + 1;
    kkt = 1;
    
    for i = 1:n
        ai = alphas(i);
        yi = y(i);
        fi = KM(i, :)*(alphas .* y') + d;
        
        % check KKT conditions
        if ~(((ai <= eps) && ((yi*fi-1) >= 1)) || ((ai > eps) && (ai < C-eps) && ((yi*fi-1) ==1)) || ...
                ((ai >= C - eps) && ((yi*fi-1) <= 1))) % Eq. 23
            kkt = 0;
            
            % select j randomly
            j = ceil(rand*n);
            while(j == i)
                j = ceil(rand*n);
            end
            
            aj = alphas(j);
            yj = y(j);
            fj = KM(j, :)*(alphas .* y') + d;
            
            % compute eta
            eta = -KM(i, i) - KM(j, j) + 2 * KM(i, j); % Eq. 14
            
            if (eta >= 0) % skip to next i
                continue;
            end
            
            % compute L and H by using Eq. 19 and 20
            if (yi == yj)
                L = max(0, ai+aj-C); % Eq. 19
                H = min(C, ai+aj);
            else
                L = max(0, aj-ai); % Eq. 20
                H = min(C, C+aj-ai);
            end
            
            if (L == H) % skip to next i
                continue;
            end
            
            % compute Ei and Ej
            Ei = fi - yi; % Eq. 17
            Ej = fj - yj;
            
            % compute new alpha j
            ajNew = aj - (yj * (Ei - Ej)) / eta; % Eq. 18
            
            % clip alpha j
            if(ajNew >= H) % Eq. 21
                ajNewClipped = H;
            elseif ((ajNew > L) &&(ajNew < H))
                ajNewClipped = ajNew;
            elseif (ajNew <= L)
                ajNewClipped = L;
            end
            
            % compute new alpha i
            aiNew = ai + yi*yj*(aj - ajNewClipped); % Eq. 22
            
            % compute d new
            aiNewNotAtBounds = false; % Eq. 25
            if ((aiNew > 0) && (aiNew < C))
                aiNewNotAtBounds = true;
                d1 = d - Ei - yi * (aiNew - ai) * KM(i, i) + yj * (ajNewClipped - aj) * KM(i, j);
            end
            aiNewNotAtBounds = false; % Eq. 26
            if((ajNewClipped > 0) && (ajNewClipped < C))
                ajNewNotAtBounds = true;
                d2 = d - Ej - yi * (aiNew - ai) * KM(i, j) + yj * (ajNewClipped - aj) * KM(j, j);
            end
            
            if (~aiNewNotAtBounds && ~ajNewNotAtBounds)
                d = (d1 + d2) / 2;
            elseif (aiNewNotAtBounds)
                d = d1;
            elseif (ajNewNotAtBounds)
                d = d2;
            end
            
            alphas(i) = aiNew;
            alphas(j) = ajNewClipped;
        end
    end
end

% idx of non zero alphas
idx = (alphas > 0.00001);
            
end

