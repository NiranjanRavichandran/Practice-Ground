import Foundation

public func mergeSort(array: [Int]) -> [Int] {
    
    if array.count < 2 {
        return array
    }
    
    let middle: Int = array.count/2
    let left = mergeSort(array: Array(array[0..<middle]))
    let right = mergeSort(array: Array(array[middle..<array.count]))
    
    return mergeArrays(a: left, b: right)
}


/// Merge two sorted arrays
public func mergeArrays(a: [Int], b: [Int]) -> [Int] {
    
    var auxArray: [Int] = []
    
    var i = 0
    var j = 0
    
    while (i < a.count) && (j < b.count) {
        if a[i] < b[j] {
            auxArray.append(a[i])
            i += 1
        } else {
            auxArray.append(b[j])
            j += 1
        }
    }
    
    while i < a.count {
        auxArray.append(a[i])
        i += 1
    }
    
    while j < b.count {
        auxArray.append(b[j])
        j += 1
    }
    
    return auxArray
}
