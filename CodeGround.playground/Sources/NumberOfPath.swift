import Foundation

//The problem is to count all the possible paths from top left to bottom right of a mXn matrix with the constraints that from each cell you can either move only to right or down
func numberOfPaths(rows: Int, columns: Int) -> Int {
    
    var count: [[Int]] = []
    
    for row in 0..<rows {
        count[row][0] = 1
    }
    
    for column in 0..<columns {
        count[0][column] = 1
    }
    
    var row = 0
    var column = 0
    
    while row < rows && column < columns {
        count[row][column] = count[row-1][column] + count[row][column-1] // count[row-1][column-1]
        row += 1
        column += 1
    }
    
    return count[row-1][column-1]
}

/*
 Note:- The count can also be calculated using the formula (m-1 + n-1)!/(m-1)!(n-1)!.
Another Approach:(Using combinatorics) In this approach We have to calculate m+n-2 C n-1 here which will be (m+n-2)! / (n-1)! (m-1)!
 
 static int numberOfPaths(int m, int n) {
 // We have to calculate m+n-2 C n-1 here
 // which will be (m+n-2)! / (n-1)! (m-1)!
     int path = 1;
     for (int i = n; i < (m + n - 1); i++)
     {
         path *= i;
         path /= (i - n + 1);
     }
     return path;
}
*/
