import Foundation

public extension Date {
    
    // Difference between dates
    func interval(component: Calendar.Component, from fromDate: Date) -> Int {
        let start = Calendar.current.ordinality(of: component, in: Calendar.Component.era, for: fromDate)
        let end = Calendar.current.ordinality(of: component, in: Calendar.Component.era, for: self)
        
        return end! - start!
        
    }
}
