import Foundation


func permuteString<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)   // display the current permutation
    } else {
        var a = a
        permuteString(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteString(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

public func swapString(string: String, i: Int, j: Int) -> String {
    var chars = Array(string)
    let tmp = chars[i]
    chars[i] = chars[j]
    chars[j] = tmp
    return String(chars)
}

public func heapPermutation(a: inout String, size: Int) {
    
    if size == 1 {
        print(a)
        return
    }
    
    for i in 0..<size {
        
        heapPermutation(a: &a, size: size - 1)
        
        if size % 2 == 0 {
            a = swapString(string: a, i: i, j: size - 1)
        } else {
            a = swapString(string: a, i: 0, j: size - 1)
        }
    }
}
