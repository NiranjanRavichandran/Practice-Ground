import Foundation

//a < b > c < d > e < f
public func printArrayInZigZag(_ input: [Int]) {
    var array = input
    // If true next element should be smaller than current
    // if false next element should be greater than current
    var flag = true
    
    for i in 0..<array.count - 1 {
        if flag {
            if array[i] > array[i+1] {
                array.swapAt(i, i+1)
            }
        } else {
            if array[i] < array[i+1] {
                array.swapAt(i, i+1)
            }
        }
        flag = !flag
    }
    
    print(array)
}
