import Foundation

extension String {
    public func reverse1() -> String {
        var reversedSelf = ""
        for i in stride(from: self.count - 1, to: -1, by: -1) {
            reversedSelf += String(self[index(startIndex, offsetBy: i)])
        }
        return reversedSelf
    }
    
    public func reverse2() -> String {
        var reversed: [Character] = []
        for i in stride(from: self.count - 1, through: 0, by: -1) {
            reversed.append(self[index(startIndex, offsetBy: i)])
        }
        return String(reversed)
    }
    
    public func reverse3() -> String {
        var reversed = Array(self)
        
        var start = 0
        var end = reversed.count - 1
        
        while start < end {
            reversed.swapAt(start, end)
            start += 1
            end -= 1
        }
        
        return String(reversed)
    }
    
}

