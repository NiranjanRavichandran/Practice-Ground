import Foundation


public extension Array where Element: Comparable {
    func findMin() -> Element {
        var min: Element = self[0]
        for index in 1..<self.count {
            if self[index] < min {
                min = self[index]
            }
        }
        return min
    }
    
    // [4, 5, 0, 0, 9]
    func findMin2() -> Element {
        var min: Element = self[0]
        var min2: Element = self[1]
        for index in 0..<self.count {
            if self[index] < min {
                min2 = min
                min = self[index]
            } else if self[index] < min2 && self[index] != min {
                min2 = self[index]
            }
        }
        return min2
    }
}
