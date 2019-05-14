import Foundation


public func strstr(_ haystack: String, _ needle: String) {
    
    var i = 0
    var j = 0
    
    var firstOccurIndex = Int.min
//    "acacat", "cat"
    while i < haystack.count && j < needle.count {
        if haystack[i] == needle[j] {
            if firstOccurIndex < 0 {
                firstOccurIndex = i
            }
            i += 1
            j += 1
        } else {
            if firstOccurIndex >= 0 {
                print("setting to", firstOccurIndex + 1)
                i = firstOccurIndex + 1
                firstOccurIndex = Int.min
            } else {
                print("here")
                i += 1
            }
            j = 0
        }
    }
    
    if firstOccurIndex >= 0 {
        print("Found", firstOccurIndex)
    }
}

