import Foundation

public func LCAofBST(root: BSTree<Int>?, n1: Int, n2: Int) -> BSTree<Int>? {
    
    guard let node = root else {
        return nil
    }
    
    if n1 < node.value && n2 < node.value {
        return LCAofBST(root: node.left, n1: n1, n2: n2)
    } else if n2 > node.value && n2 > node.value {
        return LCAofBST(root: node.right, n1: n1, n2: n2)
    }
    
    return node
    
    
}

public func findLCAofBTree(root: BSTree<Int>?, n1: Int, n2: Int) -> BSTree<Int>? {
    
    guard let node = root else {
        return nil
    }
    
    if node.value == n1 || node.value == n2 {
        return node
    }
    
    let leftLCA = findLCAofBTree(root: node.left, n1: n1, n2: n2)
    let rightLCA = findLCAofBTree(root: node.right, n1: n1, n2: n2)
    
    if leftLCA != nil && rightLCA != nil {
        return node
    }
    
    return leftLCA != nil ? leftLCA : rightLCA
}


/// Find distance of node from root - By finding the level of node from root we get its distance
func findLevel(root: BSTree<Int>?, val: Int, level: Int = 0) -> Int {
    
    guard let node = root else {
        return -1
    }
    
    if node.value == val {
        return level
    }
    
    let left = findLevel(root: node.left, val: val, level: level + 1)
    if left != -1 {
        return left
    }
    
    return findLevel(root: node.right, val: val, level: level + 1)
}
