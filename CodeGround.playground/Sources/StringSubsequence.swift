import Foundation

/// is Str1 a subsequence of Str2
public func isSubSequence(str1: String, str2: String) -> Bool {
    
    var i = 0
    var j = 0
    
    while i < str2.count && j < str1.count {
        
        if (str1[j] == str2[i]) {
            j += 1
        }
        
        i += 1
    }
    
    return j == str1.count
}

