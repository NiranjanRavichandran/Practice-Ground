import Foundation

public struct Heap {
    var nodes: [Int]
    var orderCriteria: (Int, Int) -> Bool
    
    
    public init(nodes: [Int], sort: @escaping (Int, Int) -> Bool) {
        self.nodes = nodes
        self.orderCriteria = sort
    }
    
    public func parentIndex(for index: Int) -> Int {
        return (index - 1)/2
    }
    
    public func leftIndex(for index: Int) -> Int {
        return (2 * index) + 1
    }
    
    public func rightIndex(for index: Int) -> Int {
        return (2 * index) + 2
    }
    
    mutating func shiftUp(index: Int) {
        var childIndex = index
        let child = self.nodes[childIndex]
        var parentIndex = self.parentIndex(for: index)
        
        while childIndex > 0 && nodes[parentIndex] < child {
            self.nodes[childIndex] = self.nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(for: childIndex)
        }
        self.nodes[childIndex] = child
    }
    
    mutating func shiftDown(index: Int) {
        let left = leftIndex(for: index)
        let right = rightIndex(for: index)
        var smallest = index
        
        if left <= self.nodes.count - 1 && nodes[left] < nodes[index] {
            smallest = left
        } else if right <= self.nodes.count - 1 && nodes[right] < nodes[index] {
            smallest = right
        }
        
        if smallest == index {
            return
        }
        
        self.nodes.swapAt(index, smallest)
        shiftDown(index: smallest)
    }
    
    public mutating func extractMin() -> Int {
        let min = self.nodes[0]
        
        self.nodes.swapAt(0, self.nodes.count - 1)
        self.nodes.removeLast()
        
        shiftDown(index: 0)
        
        return min
    }
    
    public mutating func insert(value: Int) {
        self.nodes.append(value)
        self.shiftUp(index: self.nodes.count - 1)
    }
}
