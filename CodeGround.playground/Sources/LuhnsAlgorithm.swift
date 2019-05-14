import Foundation

/// Validates given card number based on Luhn's Algorithm
public func isValidCarNumber(_ number: String) -> Bool {
    // We need at least 9 numbers to validate the card
    if number.count < 9 {
        return false
    }
    
    // Exit here if valid number was not passed
    guard let _ = Int64(number) else {
        return false
    }
    
    var sum = 0
    let digits = number.reversed().map { String($0) }
    for tuple in digits.enumerated() {
        guard let digit = Int(tuple.element) else {
         return false
        }
        let isOddIndex = tuple.offset % 2 == 1
        
        switch (isOddIndex, digit) {
        case (true, 9):
            sum += 9
        case (true, 0...8):
            sum += (digit * 2) % 9
        default:
            sum += digit
        }
        
    }
    return sum % 10 == 0
}
