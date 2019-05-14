import Foundation

/// Split array into two with equal sum
public func findSplitPoint(arr: [Int]) -> Int? {
    
    var leftSum = 0
    var rightSum = 0
    
    for value in arr {
        leftSum += value
    }
    
    for index in stride(from: arr.count - 1, through: 0, by: -1) {
        rightSum += arr[index]
        leftSum -= arr[index]
        if rightSum == leftSum {
            return index
        }
    }
    
    return nil
}

/// Split array in three equal sum subarrays
/// Returns array of indices to split array
public func threeEqualSumArrays(array: [Int]) -> [Int]? {
    var indices: [Int] = []
    var totalSum = 0
    
    for item in array {
        totalSum += item
    }
    
    if totalSum % 3 == 0 {
        var preSum = 0
        for (index, item) in array.enumerated() {
            preSum += item
            if preSum == (totalSum/3) {
                indices.append(index)
                preSum = 0
            }
            if indices.count == 2 {
                return indices
            }
        }
    }
    
    return nil
}

//Check if it possible to partition in k subarrays with equal sum
public func kPartitionsPossible(arr: [Int], k: Int) -> Bool {
    
    var prefixSums:[Int] = [arr[0]]
    
    for tuple in arr.enumerated() where tuple.offset > 0 {
        prefixSums.append(prefixSums[tuple.offset - 1] + tuple.element)
    }
    
    print(prefixSums)
    
    
    if (prefixSums.last ?? 1) % k != 0 {
        print("Oopsy...")
        return false
    }
    
    let sum = (prefixSums.last ?? 1)/3
    var temp = 0
    var pos = -1
    
    for index in 0..<prefixSums.count {
        
        if prefixSums[index] - (pos == -1 ? 0 : prefixSums[pos]) == sum {
            temp += 1
            pos = index
        } else if prefixSums[index] - (pos == -1 ? 0 : prefixSums[pos]) > sum {
            print("We are breaking...")
            break
        }
    }
    
    return temp == k
}
