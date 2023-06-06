function FaciesTransitionDiagram(FaciesTransitionProb, facies)
    % Create directed graph
    G = digraph(FaciesTransitionProb);
    
    % Create labels with transition probabilities
    labels = arrayfun(@(x) sprintf('%.2f', x), FaciesTransitionProb(:), 'UniformOutput', false);
    
    % Plot the graph
    p = plot(G, 'EdgeLabel', G.Edges.Weight, 'NodeLabel', facies);
    layout(p, 'layered');
    title('Transition Diagram');
end
