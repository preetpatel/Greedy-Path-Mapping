function [elevations, travelCost] = FindPathElevationsAndCost( ...
    rows, cols, elevationData)
%FindPathElevationsAndCost calculates the total cost of moving in a
%particular direction by calculating the sum of the elevation differences
%while moving across the path
%Inputs: rows - A 1D array containing the rows of the path travelled
%        cols - A 1D array containing the columns of the path travelled 
%        elevationData - a m by n 2D array containing the elevation data
%        where m represents the rows and n represents the columns
%Outputs: elevations - A 1D array containing the elevations of the path
%                      being travelled on
%         travelCost - An integer representing the total elevation change
%                      cost

%Preallocate 'elevations' and 'TravelCostArray' arrays for speed
elevations = zeros(1, length(rows));
travelCostArray = zeros(1, length(elevations));

%Loop through code for the length of rows array
for i = 1:length(rows)
    %Store the elevation data represented by the rows and columns in a 1D
    %array, elevations
    elevations(i) = elevationData(rows(i), cols(i));
end

%Set a counter to 2
i = 2;

%Loop through code until i is equal to the length of elevations array
while i <= length(elevations)
    
    %calculate the absolute of the difference between 2 points of elevation
    %and store it in a travelCostArray array
    travelCostArray(i) = abs(elevations(i) - elevations(i-1));
    
    %Add 1 to counter
    i = i+1;
    
end

%Calculate the sum of the values in the travelCostArray and store it in a
%variable, travelCost
travelCost = sum(travelCostArray);

end

