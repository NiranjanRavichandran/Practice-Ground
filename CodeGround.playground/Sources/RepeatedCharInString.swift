import Foundation

public func returnFirstRepeat(word: String) -> String? {
    var seenChars: Set<Character> = []
    for char in word {
        if seenChars.contains(char) {
            return String(char)
        } else {
            seenChars.insert(char)
        }
    }
    return nil
}

public func indexOfRepeatedChar(word: String) -> Int? {
    
    let charArray: [Character] = Array(word).sorted(by: <)
    
    print(charArray)
    return nil
}

