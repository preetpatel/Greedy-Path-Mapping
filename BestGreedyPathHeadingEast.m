function [pathRow, pathCol, elevations] = BestGreedyPathHeadingEast(elevationData)
%BestGreedyPathHeadingEast calculates the best  path starting from the
%western edge (1st column) going east. 
%Inputs: elevationData - a n x m matrix representing the elevations
%Outputs: pathRow - a 1D array containing row numbers for each of the
%                   positions
%         pathCol - a 1D array containing column numbers for each of the
%                   positions
%         elevations - a 1D array containing the elevations of each of the
%         positions chosen from the elevationData

%Author: Preet Patel

%Find the number of rows and columns in the elevationData
[rows, cols] = size(elevationData);

%Preallocate possibleRows, possibleCols and cost arrays for speed
possibleRows = zeros(rows, cols);
possibleCols = zeros(rows, cols);
cost = zeros(rows, cols);

%Loop through the number of rows in elevationData
for i = 1:rows

    %Find the possible rows and cols uning the GreedyWalk function starting
    %from each row on the first column
    [possibleRows(i, :), possibleCols(i, :)] = GreedyWalk([i, 1], 1, ...
        elevationData);
    
    %Calculate the costs for each possible 'GreedyWalk' and store it in a
    %2D array, 'cost'
    [~, cost(i, :)] = FindPathElevationsAndCost(possibleRows(i, :), ...
        possibleCols(i, :), elevationData);
end

%Find the minimum cost value from the cost array
minCost = min(cost);

%Find the position of the minimum cost from the cost array
lowCostPosition = find(cost == minCost);

%Using the lowCostPosition, find the pathRow and pathCol from the
%possibleRows
pathRow = possibleRows(lowCostPosition(1), :);
pathCol = possibleCols(lowCostPosition(1), :);

%Find the elevations for each point on the GreedyWalk and store it in a 1D
%array, 'elevations'
elevations = FindPathElevationsAndCost(pathRow, pathCol, elevationData);


end

