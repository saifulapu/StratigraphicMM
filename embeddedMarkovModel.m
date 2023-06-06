%Load CrameriColourMaps7.0.mat for the colormap
%% Facies Transition Proabibilty
FaciesTransitionProb = calcFTProb('FC.csv'); %change the facies accordingly in the calcFTProb.m function
%% Stationary distribution analysis
stationary_distribution = calcStationaryDist(FaciesTransitionProb);
%disp(stationary_distribution);
%uncomment for a simple bar chart if necessary
%facies = {'St', 'Htb (Sfl/Fle/Sw)', 'Sp', 'S (Sch/Sb/Sm)', 'F(Fm/Fst)'}; % adjust this to match your actual facies
%figure;
%bar(stationary_distribution);
%title('Stationary Distribution of Facies');
%xlabel('Facies');
%ylabel('Stationary Distribution');
%xticks(1:length(facies));
%xticklabels(facies);
%% Transitional diagram
FaciesTransitionDiagram(FaciesTransitionProb, facies);

%% Markov Model Chain computation
% Define initial state
initial_state = 1;
% Define sequence length
sequence_length = 100;
% Generate sequence
sequence = FaciesMarkovChainSim(FaciesTransitionProb, initial_state, sequence_length);
% Display sequence
%disp(sequence);

%% Markov Model chain simulation (bar)
% Define facies
facies = {'St', 'Htb (Sfl/Fle/Sw)', 'Sp', 'S (Sch/Sb/Sm)', 'F(Fm/Fst)'}; 
% Create figure
figure;
for i = 1:5
    % Define initial state
    initial_state = i;
    % Generate sequence
    sequence = FaciesMarkovChainSim(transition_probabilities, initial_state, sequence_length);
    % Calculate frequency of each state
    [counts, ~] = hist(sequence, 1:length(facies));
    % Create subplot
    subplot(5, 1, i);
    % Create bar chart
    bar(counts);
    % Set x-tick labels to facies
    xticklabels(facies);
    % Set title
    title(sprintf('Simulation %d', i*30));
end

%% Markov Model chain simulation (matrix)
FaciesMMSimulations(FaciesTransitionProb, facies, 1000, 100, 6);



