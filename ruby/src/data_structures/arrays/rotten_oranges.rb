#Given a matrix of dimension m*n where each cell in the matrix can have values 0, 1 or 2 which has the following meaning:
 #
 #0: Empty cell
 #
 #1: Cells have fresh oranges
 #
 #2: Cells have rotten oranges 
 #
 #So we have to determine what is the minimum time required so that all the oranges become rotten. A rotten orange at index [i,j] can rot other fresh orange at indexes [i-1,j], [i#1,j], [i,j-1], [i,j#1] (up, down, left and right).
 #
 #Examples:
 #
 #Input:  arr[][] = {{2, 1, 0, 2, 1},
 #                    {1, 0, 1, 2, 1},
 #                    {1, 0, 0, 2, 1}};
 #                    
 #Output:
 #All oranges can become rotten in 2 time frames.
 #
 #
 #Input:  arr[][] = {{2, 1, 0, 2, 1},
 #                    {0, 0, 1, 2, 1},
 #                    {1, 0, 0, 2, 1}};
 #                    
 #Output:
 #All oranges cannot be rotten
