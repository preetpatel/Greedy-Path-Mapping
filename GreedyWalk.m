function [rows, cols] = GreedyWalk(startPosition, direction, elevationData)
%GreedyWalk finds a path to travel in a specified direction(moving either
%towards east or west) and returns two 1D arrays with the first array being
%the rows and the second being the columns.
%Inputs:
%        startPosition - a 2 element array containing the row first and
%                        then the column of the starting position
%        direction - an integer, either +1 to represent moving towards east
%                    or -1 to represent moving towards west
%        elevationData - a m by n matrix containing the height data for the
%                        map with m representing rows and n representing
%                        columns
%Outputs:
%        rows - array representing the rows for the chosen path
%        cols - array representing the columns for the chosen path
%
%Author: Preet Patel

%Find the number of columns in the elevationData to be used for
%constraining the for loop
[~, colLimit] = size(elevationData);

%Pre-allocate rows and cols arrays for speed
if direction == -1
    rows = zeros(1, startPosition(2));
    cols = zeros(1, startPosition(2));
    
elseif direction == 1
    rows = zeros(1, ((colLimit - startPosition(2))+1));
    cols = zeros(1, ((colLimit - startPosition(2))+1));
end

%Place the start positions into the first slot of the rows and cols array
%respectively
rows(1) = startPosition(1);
cols(1) = startPosition(2);

%Check if direction is = 1 and then loop through for the number of columns
%in the elevationData minus the column of the start position.
if direction == 1
    for i = 1:(colLimit - startPosition(2))
        
        %Loop through the GreedyPick function and store the first output in
        %the (i+1) slot of the rows column and the same for the second
        %output but in the cols array
        [newPosition] = GreedyPick([rows(i), cols(i)], direction, ...
            elevationData);
        rows(i+1) = newPosition(1);
        cols(i+1) = newPosition(2);
    end
    
%Check if direction is -1
elseif direction == -1
    %Loop through from 1 to the (column of the start position - 1) times
    for i = 1:(startPosition(2)-1)
        
        %Loop through the GreedyPick function and store the first output in
        %the (i+1) slot of the rows column and the same for the second
        %output but in the cols array
        [newPosition] = GreedyPick([rows(i), cols(i)], direction, ...
            elevationData);
        rows(i+1) = newPosition(1);
        cols(i+1) = newPosition(2);
    end
end
end

