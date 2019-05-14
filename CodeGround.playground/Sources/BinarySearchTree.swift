import Foundation

public class BSTree<T: Comparable> {
    public var value: T
    public weak var parent: BSTree?
    public var left: BSTree?
    public var right: BSTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        self.init(value: array.first!)
        
        for item in array.dropFirst() {
            self.insert(item)
        }
    }
    
    public var isRoot: Bool {
        if self.parent == nil {
            return true
        }
        return false
    }
    
    public var isLeafNode: Bool {
        if self.left == nil && self.right == nil {
            return true
        }
        return false
    }
    
    var isLeftChild: Bool {
        if self === self.parent?.left {
            return true
        }
        return false
    }
    
    var isRightChild: Bool {
        if self.parent?.right === self {
            return true
        }
        return false
    }
    
    var hasLeftChild: Bool {
        return self.left != nil
    }
    
    var hasRightChild: Bool {
        return self.right != nil
            
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var count: Int {
        return (self.left?.count ?? 0) + 1 + (self.right?.count ?? 0)
    }
    
    
    public func insert(_ newValue: T) {
        if newValue > self.value {
            if self.right != nil {
                self.right?.insert(newValue)
            } else {
                self.right = BSTree(value: newValue)
                self.right?.parent = self
            }
        } else {
            if self.left != nil {
                self.left?.insert(newValue)
            } else {
                self.left = BSTree(value: newValue)
                self.left?.parent = self
            }
        }
    }
    
    public func search(_ x: T) -> BSTree? {
        if x < self.value {
            return self.left?.search(x)
        } else if x > self.value {
            return self.right?.search(x)
        } else if x == self.value {
            return self
        }
        return  nil
    }
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func reconnectParent(to node: BSTree?) {
        if let parent_ = self.parent {
            if isLeftChild {
                parent_.left = node
            } else if isRightChild {
                parent_.right = node
            }
        }
        node?.parent = self.parent
    }
    
    public func minimum() -> BSTree {
        var node = self
        
        while let next = node.left {
            node = next
        }
        
        return node
    }
    
    public func maximum() -> BSTree {
        var node = self
        
        while let next = node.right {
            node = next
        }
        
        return node
    }
    
    @discardableResult public func remove() -> BSTree? {
        var replacementNode: BSTree?
        
        // Get a replacement node before removing current node
        // Connect the replacement node to parent and child nodes
        // Unlink replacement node
        // Unlink current node
        
        // Replacement node can be either largest on the left or the smallest on the right
        if let right_ = self.right {
            replacementNode = right_.minimum()
        } else if let left_ = self.left {
            replacementNode = left_.maximum()
        }
        
        replacementNode?.remove()
        
        replacementNode?.right = self.right
        replacementNode?.left = self.left
        reconnectParent(to: replacementNode)
        
        self.parent = nil
        self.left = nil
        self.right = nil
        
        
        return replacementNode
        
    }
    
    public func predecessor() -> BSTree? {
        if let left_ = self.left {
            return left_.maximum()
        } else {
            var node = self
            while let parent_ = node.parent {
                if parent_.value < self.value {
                    return parent_
                }
                node = parent_
            }
            return nil
        }
    }
    
    public func successor() -> BSTree? {
        if let right_ = self.right {
            return right_.minimum()
        } else {
            var node = self
            while let parent_ = node.parent {
                if parent_.value > self.value {
                    return parent_
                }
                node = parent_
            }
            return nil
        }
    }
    
    public func height() -> Int {
        
        if self.isLeafNode {
            return 0
        }
        
        return 1 + max(self.left?.height() ?? 0, self.right?.height() ?? 0)
    }
    
    public func depth() -> Int {
        if self.parent == nil {
            return 0
        }
        var current = self
        var depth = 0
        while let parent = current.parent {
            current = parent
            depth += 1
        }
        
        return depth
    }
    
}

/// Build a balanced BST from a sorted array
public func buildBSTree(arr: [Int], start: Int, end: Int) -> BSTree<Int>? {
    
    if start > end {
        return nil
    }
    
    let mid = (start + end)/2
    
    let node = BSTree(value: arr[mid])
    
    node.left = buildBSTree(arr: arr, start: start, end: mid - 1)
    node.right = buildBSTree(arr: arr, start: mid + 1, end: end)
    
    return node
}

/// Checks if BSTree is balanced by height
public func isBalanced(node: BSTree<Int>?) -> Bool {
    
    if node == nil {
        return true
    }
    
    let lh = node?.left?.height() ?? 0
    let rh = node?.right?.height() ?? 0
    
    return abs(lh - rh) <= 1 && isBalanced(node: node?.left) && isBalanced(node: node?.right)
}


/// Check if BSTree is a valid tree
public func isValidTree(node: BSTree<Int>?, min: Int, max: Int) -> Bool {
    
    if node == nil {
        return true
    }
    
    if node!.value < min || node!.value > max {
        return false
    }
    
    return isValidTree(node: node?.left, min: min, max: node!.value) && isValidTree(node: node?.right, min: node!.value, max: max)
}

extension BSTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "(\(value))"
        if let right = right {
            s += "-> (\(right.description))"
        }
        
        return s
    }
}



extension BSTree {
    
    ///Breath first search AKA Level order traversal
    public func levelOrderTraversal(root: BSTree?) {
        guard let root = root else {
            return
        }
        let height = root.height()
        
        for i in 1...height { // Since height of root node is always 1 when its the only node in the tree
            printLevelNodes(node: root, level: i)
        }
    }
    
    func printLevelNodes(node: BSTree?, level: Int) {
        if node == nil {
            return
        }
        
        if level == 1 {
            print(node!.value)
        } else if level > 1 {
            
            printLevelNodes(node: node?.left, level: level - 1)
            printLevelNodes(node: node?.right, level: level - 1)
        }
        
        
    }
    
}
