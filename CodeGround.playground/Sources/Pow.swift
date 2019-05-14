import Foundation

public func myPow(_ x: Double, _ n: Int) -> Double {
    
    if n == 0 {
        return 1
    }
    
    let temp = myPow(x, n/2)
    
    if n % 2 == 0 {
        return temp * temp
    } else {
        if n > 0 {
            return x * temp * temp
        } else {
            print(temp)
            return (temp * temp) / x
        }
    }
}

public func myPow2(_ x: Double, _ n: Int) -> Double {
    
    if n == 0 {
        return 1
    }
    
    var pow = n
    var num = x
    
    if pow < 0 {
        pow = -pow
        num = 1/num
    }
    
    let temp = myPow(num, pow/2)
    
    if pow % 2 == 0 {
        return temp * temp
    } else {
        return x * temp * temp
    }
    
}

