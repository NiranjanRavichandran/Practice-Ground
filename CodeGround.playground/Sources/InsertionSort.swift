import Foundation

func insertionSort<T>(ns: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T]{
    var nums = ns
    
    for x in 1..<nums.count {
        var y = x
        let temp = nums[y]
        while y > 0 &&  isOrderedBefore(temp, nums[y - 1]) {
            nums[y] = nums[y-1]
            y -= 1
        }
        nums[y] = temp
    }
    
    return nums
}
