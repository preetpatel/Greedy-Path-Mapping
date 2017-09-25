function [reversedArray] = Reverse(array)
%The Reverse function takes an input of a standard 1D array and flips the array
%left to right and returns the flipped array
%Input: array - standard 1D array containing numerical values
%Output: reversedArray - flipped 1D array from the array fed to the
%function
%Author: Preet Patel

%Store the number of columns in the input array in a variable cols
[~, cols] = size(array);

%Since this function only uses 1D inputs, check if there are more than 1 
%columns which if so, would infer that the input is a horizonatal array
if cols ~= 1
    %Use fliplr function to flip the 1D array left to right and store it in
    %an array called reversedArray
    reversedArray = fliplr(array);
else
    %Transpose array to aid fliplr function and use fliplr function to flip
    %the 1D array left to right and store it in an array 'reversedArray'
    reversedArray = fliplr(array');
    %Transpose reversedArray back to original format
    reversedArray = reversedArray';
end

end