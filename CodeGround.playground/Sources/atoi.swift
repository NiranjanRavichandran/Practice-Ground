import Foundation

func myAtoi(str: String) -> Int {
    var res = 0
    var flag = 1
    var index = 0
    let int_max = Int.max
    let int_min = Int.min
    
    // trim
    let content = Array(str)
    while index < content.count {
        guard content[index] == " " else {
            break
        }
        index += 1
    }
    guard index < content.count else {
        return res
    }
    
    // handle flag
    if content[index] == "-" {
        flag = -1
        index += 1
    } else if content[index] == "+" {
        index += 1
    }
    
    while index < content.count {
        guard _isDigit(content[index]) else {
            break
        }
        
        res = res * 10 + Int(String(content[index]))!
        
        if res >= int_max {
            if flag == 1 {
                return int_max
            } else if res > int_max && flag == -1 {
                return int_min
            }
        }
        
        index += 1
    }
    
    return flag * res
}

private func _isDigit(_ char: Character) -> Bool {
    return char >= "0" && char <= "9"
}
