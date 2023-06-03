function [transitionMatrix, simulatedFacies] = embeddedMarkovModel(faciesData)
% input- faciesData: facies data
%output- tm: transition matrix;
%        sf: simulated facies

  % Create the transition matrix.
  transitionMatrix = transitionMatrix(faciesData);

  % Simulate facies change.
  numSteps = 100;
  simulatedFacies = simulateFaciesChange(transitionMatrix, numSteps);

end

function transitionMatrix = transitionMatrix(faciesData)

  % Count the number of times each pair of facies occur together.
  transitionCounts = accumarray(faciesData, faciesData);

  % Create the transition matrix.
  transitionMatrix = transitionCounts ./ sum(transitionCounts, 2);

end

function simulatedFacies = simulateFaciesChange(transitionMatrix, numSteps)

  % Initialize the simulated facies.
  simulatedFacies = zeros(numSteps, 1);

  % Simulate facies change for the specified number of steps.
  for i = 1:numSteps

    % Generate a random number.
    randomNumber = rand;

    % Select the next facies.
    simulatedFacies(i) = find(transitionMatrix(simulatedFacies(i - 1), :) > randomNumber);

  end

end
