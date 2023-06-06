%% Load transition count data (Exclude header)
FaciesTransitionCount = readtable('FC.csv');

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
FaciesTransitionProb = FaciesTransitionCount ./ row_sums_expanded;

%% Display the result
disp(FaciesTransitionProb);

