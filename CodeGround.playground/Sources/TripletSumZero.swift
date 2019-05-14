import Foundation


public func tripletSumZero(arr: [Int]) {
    var nums = arr.sorted()
    print(nums)
    
    
    for i in 0..<nums.count - 1 {
        if i > 0 && nums[i] != nums[i-1] {
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    print(nums[i], nums[left], nums[right])
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }

        }
    }
}
