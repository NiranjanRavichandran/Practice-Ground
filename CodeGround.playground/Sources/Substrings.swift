import Foundation

public func printAllSubstrings(string: String) {
    
    for i in 0..<string.count {
        for j in i..<string.count {
            print(string.split(from: i, to: j))
        }
    }
}

///Untested
public func longestSubstringWithDistinctChars(string: String) {
    
    var maxLength = 0
    var currLength = 0
    var start = 0
    var currSt = 0
    var visited: [Character: Int] = [:]
    
    //egeksforgeks
    for (index, char) in string.enumerated() {
        if let lastVisitedIndex = visited[char] {
            if currSt > lastVisitedIndex {
                currLength += 1
            } else {
                if currLength > maxLength {
                    maxLength = currLength // 7
                    start = currSt // 1
                    currLength -= lastVisitedIndex // 2
                    currSt = lastVisitedIndex + 1 // 1
                }
            }
            visited[char] = index
        } else {
            visited[char] = index // g=1 e=2 k=3 s=4 f=5 o=6 r=7
            currLength += 1 //7
        }
    }
    
    if currLength > maxLength {
        maxLength = currLength
        start = currSt
    }
    print(visited)
    print(string.split(from: start, to: maxLength - 1))
}

///Longest Palindromic Substring


public extension String {
    func split(from: Int, to: Int) -> String {
        let start = self.index(startIndex, offsetBy: from)
        let end = self.index(startIndex, offsetBy: to)
        return String(self[start...end])
    }
}
