import Foundation

/// Recursice approach
public func binarySearch(arr: [Int], range: Range<Int>, value: Int) -> Int? {
    
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    var found: Int?
    
    let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if value == arr[mid] {
        return mid
    } else if value > arr[mid] {
        found = binarySearch(arr: arr, range: mid + 1 ..< range.upperBound, value: value)
    } else {
        found = binarySearch(arr: arr, range: range.lowerBound..<mid, value: value)
    }
    
    return found
}

/// Iterative approach
public func iterativeBinarySearch(arr: [Int], value: Int) -> Int? {
    
    
    var lowerBound = 0
    var upperBound = arr.count
    
    while lowerBound < upperBound {
        
        let mid = lowerBound + (upperBound - lowerBound)/2
        
        if arr[mid] == value {
            return mid
        } else if value > arr[mid] {
            lowerBound = mid + 1
        } else {
            upperBound = mid
        }
    }
    
    return nil
    
}
