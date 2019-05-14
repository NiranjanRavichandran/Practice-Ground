import Foundation

public func longestCommonSubSeq(s1: String, s2: String) -> String {
    
    var dpL: [[Int]] = Array(repeating: Array(repeating: 0, count: s2.count+1), count: s1.count+1)
    
    for i in 0...s1.count {
       
        for j in 0...s2.count {
            
            if i > 0 && j > 0 {
                if s1[i-1] == s2[j-1] {
                    dpL[i][j] = 1 + dpL[i-1][j-1]
                } else {
                    dpL[i][j] = max(dpL[i-1][j], dpL[i][j-1])
                }
            }
            
        }
    }
    
    print("Longest", dpL[s1.count][s2.count])
    
    let length = dpL[s1.count][s2.count]
    var seq = ""
    var i = s1.count, j = s2.count
    
    while i >= 0 && j >= 0 {
        if s1[i-1] == s2[j-1] {
            seq = String(s1[i-1]) + seq
            i -= 1
            j -= 1
        } else if dpL[i-1][j] > dpL[i][j-1]{
            i -= 1
        } else {
            j -= 1
        }
        if seq.count == length {
            break
        }
    }
    
    return seq
}
