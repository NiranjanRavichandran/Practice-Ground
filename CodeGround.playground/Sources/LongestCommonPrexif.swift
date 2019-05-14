import Foundation

public func longestCommonPrefix(strs: [String]) {
    let minLen = getMinLen(strs)
    
    var low = 0
    var high = minLen - 1
    var prefix = ""
    
    while low <= high {
        let mid = low + (high - low)/2
        
        if checkAllContains(strs: strs, str: strs[0], low: low, high: mid) {
            prefix += strs[0].split(from: low, to: mid)
            low = mid+1
        } else {
            high = mid-1
        }
    }
    
    print(prefix)
}

func checkAllContains(strs: [String], str: String, low: Int, high: Int) -> Bool {
    
    for word in strs {
        var index = low
        
        while index <= high {
            if word[index] != str[index] {
                return false
            }
            index += 1
        }
        
    }
    
    
    return true
}

func getMinLen(_ strs: [String]) -> Int {
    var min = Int.max
    
    for str in strs {
        if str.count < min {
            min = str.count
        }
    }
    
    return min
}
