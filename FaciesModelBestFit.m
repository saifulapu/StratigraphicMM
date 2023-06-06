function rmse = FaciesModelBestFit(model_distribution, observed_sequence)
    % Convert sequence to frequencies
    observed_frequency = histcounts(observed_sequence, 'Normalization', 'probability');

    % Calculate the root mean squared error (RMSE)
    rmse = sqrt(mean((model_distribution - observed_frequency).^2));

    % Scatter plot
    %scatter(1:length(model_distribution), model_distribution);
    %hold on;
    %scatter(1:length(observed_frequency), observed_frequency);
    
    % Line plot
    plot(1:length(model_distribution), model_distribution, 'LineWidth', 2);
    hold on;
    plot(1:length(observed_frequency), observed_frequency, 'LineWidth', 2);
   
    % Box plot (uncomment this if you want to use boxplot instead of line plot)
    % boxplot([model_distribution(:), observed_frequency(:)], 'Labels',{'Model','Observed'});
  
    
    legend('Model', 'Observed');
    xlabel('Facies');
    ylabel('Probability');
end

