import Foundation

public func quickSort(array: inout [Int], startIndex: Int, endIndex: Int) {
    
    if startIndex >= endIndex {
        return
    }
    
    let pIndex = getPartitionIndex(array: &array, startIndex: startIndex, endIndex: endIndex)
    quickSort(array: &array, startIndex: startIndex, endIndex: pIndex - 1)
    quickSort(array: &array, startIndex: pIndex + 1, endIndex: endIndex)
    
}

// Assuming this function is passed an array with atleast one value
func getPartitionIndex(array: inout [Int], startIndex: Int, endIndex: Int) -> Int {
    let pivot = array[endIndex]
    var pIndex = startIndex
    
    for index in startIndex..<endIndex {
        if array[index] <= pivot {
            array.swapAt(index, pIndex)
            pIndex += 1
        }
    }
    
    array.swapAt(pIndex, endIndex)
    
    return pIndex
}
