# BestGreedyPath
BestGreedyPath finds the best path moving from the western edge to the eastern edge 
This function is written in the MATLAB programming language 

BestGreedyPath finds the best path moving from the western edge to the
eastern edge. It calculates the possible costs for each path calculated by
the GreedyWalk function for each point in the elevation data and then
displays the pathRow and pathCol for the lowest costing path.
Inputs: elevationData - a n x m matrix representing the elevations
Outputs: pathRow - a 1D array containing row numbers for each of the
                   positions. \n
         pathCol - a 1D array containing column numbers for each of the
                   positions
         elevations - a 1D array containing the elevations of each of the
                    positions chosen from the elevationData
