function FaciesMMSimulations(FaciesTransitionProb, facies, num_simulations, sequence_length, num_plots)
    % Initialize an array to hold all sequences
    all_sequences = zeros(num_simulations, sequence_length);

    % Generate all sequences
    for i = 1:num_simulations
        initial_state = randi(length(facies)); % You can replace this with your own logic
        sequence = FaciesMarkovChainSim(FaciesTransitionProb, initial_state, sequence_length);
        all_sequences(i, :) = sequence;
    end

    % Select random simulations to plot
    rand_indices = randperm(num_simulations, num_plots);

    % Plot each selected simulation
    for i = 1:length(rand_indices)
        index = rand_indices(i);
        sequence = all_sequences(index, :);

        % Calculate transition counts
        simulated_transition_counts = zeros(size(FaciesTransitionProb));
        for j = 1:size(sequence, 2) - 1
            simulated_transition_counts(sequence(j), sequence(j + 1)) = ...
                simulated_transition_counts(sequence(j), sequence(j + 1)) + 1;
        end

        % Calculate transition probabilities
        simulated_transition_probabilities = simulated_transition_counts ./ sum(simulated_transition_counts, 2);

        % Plot the heatmap for each selected simulation
        subplot(ceil(sqrt(num_plots)), ceil(sqrt(num_plots)), i); % arrange plots in a square layout
        imagesc(simulated_transition_probabilities);    % create a heatmap
        colormap(crameri('batlow'));  % Use the 'batlow' colormap from the crameri package
        colorbar;                             % show a colorbar
        title(['Simulation ', num2str(index)]);
        xlabel('Next Facies');
        ylabel('Current Facies');

        % Set the tick values and labels to match the facies
        xticks(1:length(facies));
        xticklabels(facies);
        yticks(1:length(facies));
        yticklabels(facies);
    end
end
