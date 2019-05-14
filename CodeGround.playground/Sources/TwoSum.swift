import Foundation

public func twoSum(arr: [Int], target: Int) -> Bool {
    var set = Set<Int>()
    for num in arr {
        let x = target - num
        if set.contains(x) {
            return true
        }
        else {
            set.insert(num)
        }
    }
    return false
}

public func sumExists(input: inout [Int], target: Int) -> Bool {
    
    input = input.sorted()
    
    var left = 0
    var right = input.count - 1
    
    while left < right {
        let sum = input[left] + input[right]
        if sum == target {
            print(input[left], input[right])
            return true
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return false
}
