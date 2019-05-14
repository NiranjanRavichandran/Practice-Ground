import Foundation

// MARK: - Sorted Rows
// Search a matrix for given number and the given matrix is sorted by row in increasing order
public func searchRowSortedMatrix(matrix: [[Int]], x: Int) -> (Int, Int) {
    
// x = 11
//    | 1  2  3  4|
//    | 5  6  7  8|
//    | 9 10 11 12|
//    |13 14 15 16|
    
//    |17 18 19 20|
    
    let col = (matrix.first?.count ?? 0)/2
    var rowLow = 0
    var rowHigh = matrix.count - 1
    
    while rowLow+1 < rowHigh {
        let rowMid = rowLow + (rowHigh - rowLow)/2
        if matrix[rowMid][col] == x {
            print("Found at", rowMid, col)
            return (rowMid, col)
        } else if matrix[rowMid][col] > x {
            rowHigh = rowMid - 1
        } else {
            rowLow = rowMid + 1
            print("here", rowLow)
        }
    }
    
    // there are only two row so lets search the rows
    if matrix[rowLow][col] == x {
        print("Found at", rowLow, col)
        return (rowLow, col)
    } else if matrix[rowLow+1][col] == x {
        print("Found at", rowLow+1, col)
        return (rowLow, col)
    } else if matrix[rowLow][col] > x {
        return binarySearchRow(matrix: matrix, row: rowLow, columnLow: 0, columnHigh: col-1, x: x)
    } else if matrix[rowLow][col] < x {
        return binarySearchRow(matrix: matrix, row: rowLow, columnLow: col+1, columnHigh: matrix.count - 1, x: x)
    } else if matrix[rowLow+1][col] > x {
        return binarySearchRow(matrix: matrix, row: rowLow+1, columnLow: 0, columnHigh: col-1, x: x)
    } else if matrix[rowLow+1][col] < x {
        return binarySearchRow(matrix: matrix, row: rowLow+1, columnLow: col+1, columnHigh: matrix.count - 1, x: x)
    }

    
    return (-1, -1)
}

func binarySearchRow(matrix: [[Int]], row: Int, columnLow: Int, columnHigh: Int, x: Int) -> (Int, Int) {
    print("Doing binary search in row", row, "from", columnLow, "to", columnHigh)
    var low = columnLow
    var high = columnHigh
    
    while low <= high {
        let columnMid = low + (high - low)/2
        
        if matrix[row][columnMid] == x {
            print("Found at", row, columnMid)
            return (row, columnMid)
        } else if x > matrix[row][columnMid] {
            low = columnMid + 1
        } else {
            high = columnMid - 1
        }
    }
    
    print("Not found")
    return (-1, -1)
}

// MARK: - Sorted Rows and Columns
// Search a matrix which is sorted by row and column in increasing order
public func searchSortedMatrix(matrix: [[Int]], x: Int) {
    
    var row = 0
    var column = (matrix.first?.count ?? 0) - 1
    
    while row >= 0 && column >= 0 && row < matrix.count && column < (matrix.first?.count ?? 0) {
        if matrix[row][column] == x {
            print("Found at", row, column)
            return
        } else if matrix[row][column] > x {
            column -= 1
        } else {
            row += 1
        }
    }
}



