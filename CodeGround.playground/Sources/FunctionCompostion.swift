import Foundation

precedencegroup SingleTypeComposition {
    associativity: right
}

infix operator <>: SingleTypeComposition

public func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}
