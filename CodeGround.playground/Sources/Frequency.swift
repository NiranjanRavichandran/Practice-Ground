import Foundation

// Function to find counts of all elements present in
// arr[0..n-1]. The array elements must be range from
// 1 to n

//[1, 5, 3, 5, 4]
public func findFrequency(arr: [Int]) -> [Int] {
    var array = arr
    var index = 0
    
    while index < array.count {
        
        if array[index] <= 0 {
            index += 1
            continue
        }
        
        let elementIndex = array[index] - 1
        if array[elementIndex] > 0 {
            array[index] = array[elementIndex]
            array[elementIndex] = -1
        } else {
            array[elementIndex] -= 1
            array[index] = 0
            index += 1
        }
    }
    
    return array
}
