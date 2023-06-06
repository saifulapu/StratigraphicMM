function stationary_distribution = calcStationaryDist(transition_probabilities)
%Input- Transition Probability (The computation from calcFTProb.m function)
%Output- calcStationaryDist gives steady state behaviour of the future
%based on the eigenvalue computation and analysis.

    % Ensure transition_probabilities is square
    assert(size(transition_probabilities, 1) == size(transition_probabilities, 2), 'Transition probabilities matrix must be square')

    % Compute the stationary distribution
    [eigenvectors, eigenvalues] = eig(transition_probabilities');
    
    % The stationary distribution corresponds to the eigenvector with an eigenvalue of 1
    for i = 1:size(eigenvalues, 1)
        if abs(eigenvalues(i,i) - 1) < 1e-8
            stationary_distribution = real(eigenvectors(:, i)');
            % Normalize to make it a valid probability distribution
            stationary_distribution = stationary_distribution / sum(stationary_distribution);
            return
        end
    end

    error('No stationary distribution found')
end
