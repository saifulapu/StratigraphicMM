function FaciesTransitionProbability = calcFTProb(x)
% Input-x is (.csv) file which contains the transition count data 
% 
% Output-calcFTProb returns facies transitional probaility based on the manual
% calculation of the transition count from the field data. It also
% generates a heatmap based on the calculation.
% 
% Load different colormap based on the crameri function as follows:
% Scientific Color Map (crameri function): https://github.com/chadagreene/crameri.git
%Crameri, Fabio. (2021). Scientific colour maps (7.0.1). Zenodo. https://doi.org/10.5281/zenodo.5501399

    %% Load count ( data (Exclude header)
    FaciesTransitionCount = readtable(x);

    %% Ensure the matrix is square (number of rows equals number of columns)
    assert(size(FaciesTransitionCount, 1) == size(FaciesTransitionCount, 2), 'Transition matrix must be square')

    %% Calculate transition probabilities by normalizing each row
    % Convert table to array
    FaciesTransitionCount = table2array(FaciesTransitionCount);

    % Calculate row sums
    row_sums = sum(FaciesTransitionCount, 2);

    % Expand row sums to the size of transition_counts
    row_sums_expanded = repmat(row_sums, 1, size(FaciesTransitionCount, 2));

    % Calculate transition probabilities
    FaciesTransitionProbability = FaciesTransitionCount ./ row_sums_expanded;

    %% Image
    facies = {'St', 'Htb (Sfl/Fle/Sw)', 'Sp', 'S (Sch/Sb/Sm)', 'F(Fm/Fst)'}; % adjust this to match your actual facies

    % Assuming transition_probabilities is your matrix
    figure;
    imagesc(FaciesTransitionProbability);    % create a heatmap
    colormap(crameri('batlow'));  % Use the 'batlow' colormap from the crameri package
    colorbar;                             % show a colorbar
    title('Transition Probability Heatmap');
    xlabel('Next Facies');
    ylabel('Current Facies');

    % Set the tick values and labels to match the facies
    xticks(1:length(facies));
    xticklabels(facies);
    yticks(1:length(facies));
    yticklabels(facies);
    
end
