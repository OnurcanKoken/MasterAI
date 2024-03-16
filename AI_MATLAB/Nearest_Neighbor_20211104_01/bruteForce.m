function [v, pred]=bruteForce(X, y, U)

    pred = [];
    v = [];
    for i = 1:length(U)
        sub_v = [];
        % find the nearest point
        for j = 1:length(X)
            % calculate Euclidean distance between U and X row by row
            sub_v = [sub_v, pdist([U(i,:);X(j,:)])];
        end
        % nearest distance and index of that neighbor
        [~, neighbor] = min(sub_v);
        % get the class of nearest point for each U point
        pred = [pred, y(neighbor)];
        % save the distances
        v = [v; sub_v];
    end
    
end