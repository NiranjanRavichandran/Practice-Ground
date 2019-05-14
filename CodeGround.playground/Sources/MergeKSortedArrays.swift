import Foundation

//public func mergeKSortedNodes(nodes: [[Int]]) -> [Int] {
//    let heap = MinHeap([])
//    for node in nodes {
//        for child in node {
//            heap.insert(item: child)
//        }
//    }
//
//    var sortedMerged: [Int] = []
//    while heap.nodes.count > 0 {
//        sortedMerged.append(heap.extractMin()!)
//    }
//    return sortedMerged
//}

public struct HeapData {
    var arrayIndex: Int
    var index: Int
    var data: Int
}


public func mergeSortedArrays(arrays: [[Int]]) {
    let heap = MinHeap([])
    var mergedArray: [Int] = []
    
    for (aIndex, array) in arrays.enumerated() {
        heap.insert(item: HeapData(arrayIndex: aIndex, index: 0, data: array[0]))
    }
    print("So Far", heap.nodes)
    while heap.nodes.count > 0 {
        if var min = heap.peek() {
            mergedArray.append(min.data)
            min.index += 1
            if min.index < arrays[min.arrayIndex].count {
                min.data = arrays[min.arrayIndex][min.index]
                heap.nodes[0] = min
                heap.shiftDown(index: 0)
            } else {
                min.data = Int.max
                heap.nodes[0] = min
                heap.shiftDown(index: 0)
                heap.nodes.removeLast()
            }
            
        }
    }
    
    print("Merged Array", mergedArray)
}

public class MinHeap {
    
    public var nodes: [HeapData] = []
    
    public init(_ arr: [HeapData]) {
        for item in arr {
            insert(item: item)
        }
    }
    
    public func insert(item: HeapData) {
        nodes.append(item)
        shiftup(index: nodes.count - 1)
    }
    
    func shiftup(index: Int) {
        if let parent = getParent(for: index) {
            if nodes[parent].data > nodes[index].data {
                nodes.swapAt(parent, index)
                shiftup(index: parent)
            }
        }
    }
    
    func shiftDown(index: Int) {
        let left = getLeft(for: index)
        let right = getRight(for: index)
        var smallest = index
        if left < nodes.count && nodes[left].data < nodes[smallest].data {
            smallest = left
        }
        if right < nodes.count && nodes[right].data < nodes[smallest].data {
            smallest = right
        }
        
        if smallest != index {
            nodes.swapAt(smallest, index)
            shiftDown(index: smallest)
        }
    }
    
    func getParent(for index: Int) -> Int? {
        let pIndex = (index - 1)/2
        if pIndex >= 0 && pIndex < nodes.count {
            return pIndex
        }
        return nil
    }
    
    func getLeft(for index: Int) -> Int {
        return (index * 2) + 1
    }
    
    func getRight(for index: Int) -> Int {
        return (index * 2) + 2
    }
    
    public func extractMin() -> HeapData? {
        if nodes.isEmpty {
            return nil
        }
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        nodes.swapAt(0, nodes.count - 1)
        let min = nodes.removeLast()
        shiftDown(index: 0)
        return min
    }
    
    public func peek() -> HeapData? {
        return self.nodes.first
    }
}
