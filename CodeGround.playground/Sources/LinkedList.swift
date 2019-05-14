import Foundation

public class LinkedListNode<T> {
    public var data: T
    public var next: LinkedListNode?
    
    public init(data: T) {
        self.data = data
        self.next = nil
    }
    
    public func append(value: T) {
        if let next_ = next {
            next_.append(value: value)
        } else {
            print(value)
            self.next = LinkedListNode(data: value)
        }
    }
    
    public func printAll() {
        var node: LinkedListNode? = self
        while let _ = node {
            print(node!.data, ">>")
            node = node?.next
        }
    }
}

/// Reverse a linked list
public func reverseLinkedList(head: LinkedListNode<Int>?) {
    if head == nil {
        return
    }
    
    var listToDo = head?.next
    var reversed = head
    reversed?.next = nil
    
    while let _ = listToDo {
        let tmp = listToDo
        listToDo = listToDo?.next
        
        tmp?.next = reversed
        reversed = tmp
    }
    
    while let _ = reversed {
        print(reversed!.data)
        reversed = reversed?.next
    }
}


/// Merge two linked lists in sorted Order - Recursive approach

public func mergeLinkedLists(aList: LinkedListNode<Int>?, bList: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    
    var merged: LinkedListNode<Int>?
    
    if aList == nil {
        return bList
    }
    
    if bList == nil {
        return aList
    }
    
    if aList!.data <= bList!.data {
        merged = aList
        merged?.next = mergeLinkedLists(aList: aList?.next, bList: bList)
    } else {
        merged = bList
        merged?.next = mergeLinkedLists(aList: aList, bList: bList?.next)
    }
    
    return merged
}


// Merge linked lists iterative approach
public func mergeLists(aList: LinkedListNode<Int>?, bList: LinkedListNode<Int>?) -> LinkedListNode<Int>? {
    
    var tail: LinkedListNode<Int>?
    
    var aHead: LinkedListNode<Int>? = aList
    var bHead: LinkedListNode<Int>? = bList
    
    while aHead != nil && bHead != nil {
        if aHead!.data <= bHead!.data {
            if tail == nil {
                tail = aHead
            } else {
                tail?.next = aHead
                tail = tail?.next
            }
            aHead = aHead?.next
            
        } else {
            if tail == nil {
                tail = bHead
            } else {
                tail?.next = bHead
                tail = tail?.next
            }
            bHead = bHead?.next
        }
    }
    
    while aHead != nil {
        if tail == nil {
            tail = aHead
        } else {
            tail?.next = aHead
            tail = tail?.next
            
        }
        aHead = aHead?.next
    }
    
    while bHead != nil {
        if tail == nil {
            tail = bHead
        } else {
            tail?.next = bHead
            tail = tail?.next
        }
        bHead = bHead?.next
    }
    
    return tail
    
}


// Merge two sorted linked Lists in place - Untested
func mergeTwoListsInPlace(aList: LinkedListNode<Int>, bList: LinkedListNode<Int>) -> LinkedListNode<Int>? {
    
    func mergeUtil(aList: LinkedListNode<Int>, bList: LinkedListNode<Int>) -> LinkedListNode<Int>? {
        
        if aList.next == nil {
            aList.next = bList
            return aList
        }
        
        var aCurrent: LinkedListNode<Int>? = aList
        var bCurrent: LinkedListNode<Int>? = bList
        var aNext = aList.next
        var bNext = bList.next
        
        // if bCurrent lies in between curr1 and next1
        // then do aCurrent->bCurrent->aNext
        while aNext != nil && bNext != nil {
            if bCurrent!.data > aCurrent!.data && bCurrent!.data < aNext!.data {
                
                bNext = bCurrent?.next
                aCurrent?.next = bCurrent
                bCurrent?.next = aNext
                
                // now let aCurrent and bCurrent to point
                // to their immediate next pointers
                aCurrent = bCurrent
                bCurrent = bNext
                
            } else {
                
                if aNext?.next == nil {
                    aNext?.next = bCurrent
                } else {
                    aCurrent = aNext
                    aNext = aCurrent?.next
                }
            }
        }
        
        return nil
        
    }
    
    if aList.data < bList.data {
        return mergeUtil(aList: aList, bList: bList)
    } else {
        return mergeUtil(aList: bList, bList: aList)
    }
}
