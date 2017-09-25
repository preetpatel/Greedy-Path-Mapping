function [pathRow, pathCol, elevations] = BestGreedyPath(elevationData)
%BestGreedyPath finds the best path moving from the western edge to the
%eastern edge. It calculates the possible costs for each path calculated by
%the GreedyWalk function for each point in the elevation data and then
%displays the pathRow and pathCol for the lowest costing path.
%Inputs: elevationData - a n x m matrix representing the elevations
%Outputs: pathRow - a 1D array containing row numbers for each of the
%                   positions
%         pathCol - a 1D array containing column numbers for each of the
%                   positions
%         elevations - a 1D array containing the elevations of each of the
%         positions chosen from the elevationData

%Author: Preet Patel

%Calculate the number of rows ('maxRows') and columns ('maxCols') for the
%elevationData
[maxRows, maxCols] = size(elevationData);

%Create a 2D array of the same size as elevationData but all the values
%filled with ones
notVisited = ones(maxRows, maxCols);

%Set counter to 1
counter = 1;

%Loop through each point in the elevationData matrix
for i = 1:maxRows
    for j = 1:maxCols
        
        %Check if the point is on the 1st column and it's notVisited value
        %is set to 1 which means that that point has not been crossed
        if j == 1 && notVisited(i, j)
            
            %Use the GreedyWalk function to find the rows and columns for
            %the best path starting from the point represented by i
            %(representing row number) and j (representing column number)
            %from the elevationData heading east
            [rows(counter, :), cols(counter, :)] = GreedyWalk([i, j], ...
                1, elevationData);
            
            %Update the counter
            counter = counter + 1;
            
        %Check if the point is on the last column and it's notVisited value
        %is set to 1 which means that that point has not been crossed
        elseif j == maxCols && notVisited(i, j)
            
            %Use the GreedyWalk function to find the rows and columns for
            %the best path starting from the point represented by i
            %(representing row number) and j (representing column number)
            %from the elevationData heading west
            [rows(counter, :), cols(counter, :)] = GreedyWalk([i, j], ...
                -1, elevationData);
            
            %Update the counter
            counter = counter + 1;
            
        %Check if the point has not been visited
        elseif notVisited(i, j)
            
            %Calculate rows and cols for the path heading east from that
            %point
            [tempRowEast, tempColEast] = GreedyWalk([i, j], 1, ...
                elevationData);
            
            %Calculate rows and cols for the path heading west from that
            %point
            [tempRowWest, tempColWest] = GreedyWalk([i, j], -1, ...
                elevationData);
            
            %Reverse the values of the rows and columns for paths heading
            %west
            tempRowWest = Reverse(tempRowWest);
            tempColWest = Reverse(tempColWest);
            
            %Remove the first values from tempRowEast and tempColEast as
            %they also exist as a starting point in rows and columns for
            %the path heading west
            tempRowEast(1) = [];
            tempColEast(1) = [];
            
            %Merge both eastward and westward paths together to create a
            %single path starting from the west and heading east
            rows(counter, :) = [tempRowWest, tempRowEast];
            cols(counter, :) = [tempColWest, tempColEast];
            
            %For each point visited in the path calculated, mark those
            %points 'notVisited' value as 0 indicating that that point has
            %been visited
            for m = 1:maxCols
                notVisited(rows(counter, m), cols(counter, m)) = 0;
            end
            
            %Update the counter
            counter = counter + 1;
        end
    end
end

%Preallocate travelCost array to increase speed
travelCost = zeros(1, length(rows));

%Loop for the number of rows in the 2D array, 'rows'
for k = 1:length(rows)
    %Find the travel costs for each possible path using the
    %FindPathElevationsAndCost and values from rows and cols and store the
    %costs in an array, 'travelCost'
    [~, travelCost(k)] = FindPathElevationsAndCost(rows(k, :), ...
        cols(k, :), elevationData);
end

%Find the minimum cost from the travelCost array
minCost = min(travelCost);
%Find the location of the minimum cost in the travelCost array
minCostLocations = find(travelCost == minCost);

%Access the rows and cols of the minimum cost location from the 'rows' and
%'cols' array and store them in pathRow and pathCol respectively
pathRow = rows(minCostLocations(1), :);
pathCol = cols(minCostLocations(1), :);

%Find the elevations of each point using the FindPathElevationsAndCost
%function
elevations = FindPathElevationsAndCost(pathRow, pathCol, elevationData);

end

