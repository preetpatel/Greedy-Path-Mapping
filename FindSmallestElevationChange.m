function smallestPosition = FindSmallestElevationChange(current, list)

%The function, FindSmallestElevationChange takes the current elevation of 
%a point and calculates the elevation cost with the array provided and 
%returns the position of the smallest position
%Inputs: current = the current elevation
%        list = a 1D array of possible elevations to compare current
%               positions with
%Output: smallestPosition = the row indicating the position of the
%smallest compared elevation change with respect to 'current'
%Author: Preet Patel

%Calculate the absolute of the current value subtracted from the
%list values 
cost = abs(list - current);

%Use find function to find the minimum of the array 'cost' and store it in 
%the variable smallestPosition
smallestPosition = find(cost == min(cost));

end