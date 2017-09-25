function [newPosition] = GreedyPick(currentPosition, direction, elevationData)
%GreedyPick uses the current position, direction (defined +1 for moving
%towards east and -1 for moving towards west) and the available
%elevationData to pick the next position for and then returns a 1D array
%with the first element representing the row and the second representing
%the column of the new position. 
%Inputs:
%   currentPosition - a 2 element 1D array containing row and column data
%                     for current position respectively.
%   direction - a variable representing direction with +1 indicating moving
%               towards east and -1 representing movement towards west.
%   elevationData - a 2D m by n matrix representing the elevation data
%                   where m is the number of rows and n is the number of
%                   columns
%Outputs:
%   newPosition - A 1D array with the first element containing the row
%   number for the chosen path and the second element containing the column
%   number for the chosen path

%Author: Preet Patel

%Add the direction to the column of the currentPosition to represent moving
%east(if direction is +1) or west(if direction is -1)
newPosition(2) = currentPosition(2) + direction;

%Find size of the elevationData
[rows, ~] = size(elevationData);

%Check if the current position is on the first row
if currentPosition(1) == 1
    
    %Store the first value as infinity because a position above the first 
    %row can't exist. The second value is the elevation on the following
    %column but on the same row and the third value is the elevation on the
    %following column but on the row below the current.
    possibleElevations = [inf, (elevationData(currentPosition(1), ...
        newPosition(2))), (elevationData((currentPosition(1) +1), ...
        newPosition(2)))];

%Check if the current position is on the last row
elseif currentPosition(1) == rows
    
    %Store the first value as the evevation on the following column but on
    %the row above the current. The second value is the elevation on the
    %following column but on the same row and the third value as infinity
    %because a position below the last row can't exist.
    possibleElevations = [(elevationData((currentPosition(1) - 1), ...
        newPosition(2))), (elevationData(currentPosition(1), ...
        newPosition(2))), inf];
    
else
    
    %Store the first value as the evevation on the following column but on
    %the row above the current. The second value is the elevation on the
    %following column but on the same row. The third value is the elevation
    %on the following column but on the row below the current.
    possibleElevations = [(elevationData((currentPosition(1) - 1), ...
        newPosition(2))), (elevationData(currentPosition(1), ...
        newPosition(2))), (elevationData((currentPosition(1) +1), ...
        newPosition(2)))];
end

%Use FindSmallestElevationChange function to find the  rows of the
%elevation that gives the smallest elevation change
newPossibleRows = FindSmallestElevationChange(elevationData( ...
    currentPosition(1), currentPosition(2)), possibleElevations);

%Retrieve the first row of the recently found possible rows and store it as
%the first element in newPosition as it represents the row value
newPosition(1) = (newPossibleRows(1)+currentPosition(1))-2;

end
