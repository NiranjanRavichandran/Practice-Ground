import Foundation

public func validParentheses(input: String) -> Bool {
    
    var stack: [Character] = []
    
    for char in input {
        if char == "(" || char == "{" || char == "[" {
            stack.append(char)
        } else if char == ")" || char == "}" || char == "]" {
            if stack.isEmpty {
                return false
            }
            
            if let last = stack.last, isMathcingPair(char1: last, char2: char) {
                stack.removeLast()
            }
        }
    }
    
    if stack.count == 0 {
        return true
    }
    
    return false
    
}

func isMathcingPair(char1: Character, char2: Character) -> Bool {
    
    if char1 == "(" && char2 == ")" {
        return true
    } else if char1 == "{" && char2 == "}" {
        return true
    } else if char1 == "[" && char2 == "]" {
        return true
    }
    
    return false
}
