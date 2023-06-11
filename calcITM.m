function R = calcITM(transition_counts)
    % Get the total number of transitions
    N = sum(transition_counts(:));
    
    % Initialize the independent trials matrix
    R = zeros(size(transition_counts));
    
    % Calculate column totals
    C = sum(transition_counts, 1);
    
    % Compute each element of the matrix
    for i = 1:size(R, 1)
        for j = 1:size(R, 2)
            R(i, j) = C(j) / N - C(i);
        end
    end
    
    % Set the diagonal elements to 0
    R(eye(size(R)) == 1) = 0;
end
