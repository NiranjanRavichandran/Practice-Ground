import Foundation

public func editDistance(str1: String, str2: String) -> Int {
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: str2.count), count: str1.count)
    
    for i in 0..<str1.count {
        for j in 0..<str2.count {
            
            if i == 0 {
                // If first string is empty, only option is to
                // insert all characters of second string
                dp[i][j] = j // Min operation is j
            } else if j == 0 {
                // If second string is empty, only option is to
                // remove all characters of second string
                dp[i][j] = i // Min operation is i
            } else if str1[i-1] == str2[j-1] {
                // If last characters are same, ignore last char
                // and recur for remaining string
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = 1 + min(dp[i][j-1], //Insert
                                   dp[i-1][j], //Remove
                                   dp[i-1][j-1]) //Replace
            }
            
        }
    }
    
    return dp[str1.count - 1][str2.count - 1]
    
}


public extension String {
    subscript (i: Int) -> Character {
        let position = self.index(startIndex, offsetBy: i)
        return self[position]
    }
}
