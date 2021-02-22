import UIKit
import Foundation

class Node {
    var next: Node?
    var data: Int
    
    
    init(_ data:Int) {
        self.data = data
    }
    func appendIteratively (_ data: Int) {

        var current = self
        while let next = current.next {
            current = next
        }
        current.next = Node(data)
    }
    
    func appendRecursively(_ head: Node?, _ data: Int) -> Node {
        guard let head = head else { return Node(data) }
        head.next = appendRecursively(head.next, data)
        return head
    }
    
    func removeNodeIteratively(_ head: Node?, _ data:Int) -> Node {
        var curr = head
        while let next = curr?.next {
            if next.data == data {
                curr?.next = next.next
            }
            curr = next
        }
        
        return head!
    }
    
    func removeNodeRecursively(_ head: Node?, _ data: Int) -> Node {
        guard let curr = head else { return head! }
        //first node is not removed with this if curr.data, other nodes do
        if curr.data == data {
            return curr.next!
        }
        if curr.next?.data == data {
            curr.next = curr.next?.next
            return curr
        }
        curr.next = removeNodeIteratively(curr.next, data)
        return curr
    }
    
    func removeDuplicates(_ head: Node?)  {
        var curr = head
        var set = Set<Int>()
        while let next = curr?.next {
            if !set.contains(curr!.data) {
                set.insert(curr!.data)
                continue
            }
                curr = next
        }
        var currNew:Node? = Node(0)
        for ele in set {
            currNew?.appendIteratively(ele)
        }
        printData((currNew?.next!)!)
    }
    
    //O(n) time, O(N) buffer
    func removeDuplicates2(_ head:Node?) {
        var node = head
        var set = Set<Int>()
        var prev:Node? = nil
        while let curr = node {
            if set.contains(curr.data) {
                prev?.next = curr.next
            } else {
                set.insert(curr.data)
                prev = curr
            }
            node = curr.next
        }
    }
    
    /// Complexity: O(n^2) time and O(1) space, unsorted node
    func removeDupWithRunner(_ head: Node?) {
        var node = head
        while let curr = node {
            //remove all future nodes that have same value with runner node
            var runner = curr.next
            while runner != nil {
                //checks if consecutive datas similar
                if curr.data == runner?.data{
                    curr.next = runner?.next
                    runner = runner?.next
                }//check to see if last node is equal to current node
                else if curr.data == runner?.next?.data {
                    runner?.next = runner?.next?.next
                } else {
                    //if none of the nodes match with current node, move forward the runner
                    runner = runner?.next
                }
            }
            node = curr.next
        }
    }
    func countNode(_ node: Node?) -> Int {
        var count = 0
        guard let node = node else { return 0}
        return 1 + countNode(node.next)
    }
    
    func kthLastElement(_ node:Node?, _ k:Int) -> Int {
        var offSet = (node?.countNode(node))! - k
        var head = node
        while offSet != 0{
                head = head?.next
                offSet -= 1
            }
        return head!.data
    }
    
    func kthLastElementRec(_ node: Node?, _ k:Int) -> Int {
        guard let head = node else { return 0 }
        let eleIndex = 1 + kthLastElementRec(head.next, k)
        if eleIndex == k {
            print("\(k)th to the last node \(head.data)")
        }
        return eleIndex
    }
    
    func isPalindrome(_ node: Node?) -> Bool {
        //guard let node = node else { return true }
        var node = node
        var stack = [Int]()
        while let head = node {
            stack.append(head.data)
            //head = head.next
            node = head.next
        }
        var first = 0
        var last = stack.count - 1
        for ele in stack {
            print(ele)
        }
        while last > first {
            if stack[first] == stack[last] {
                first += 1
                last -= 1
            } else {
                return false
            }
        }
        return true
    }
    
    /*:
    2.7 Determine if two singly linked lists intersect, and return the intersecting node if they do. \
    Intersection is defined by reference not value, i.e. the lists intersect if the ith node of one list is the same by reference as the kth node of the other list.
    */
    func intersection(_ lhs:Node?, _ rhs: Node?) -> Node? {
        //run through the each linkedlist to get the lengths and the tails
        let (lelftTail, leftCount) = countAndTail(lhs)
        let (rightTail, rightCount) = countAndTail(rhs)
        
        //compare the tails, if they are different(by reference, not by value), return immediately. That means there is no intersection
        guard lelftTail === rightTail else { return nil }
        
        //set 2 pointers to the start of each linkedlist
        var left = lhs
        var right = rhs
        
        //get difference between length of linkedlists
        let moveCount = abs(leftCount - rightCount)
        //choose which node we need to advance
        var moveNode = leftCount > rightCount ? left : right
        
        //On the longer linkedList, advance its pointer by the difference in lengths. And then each node will be starting same node
        move(&moveNode, by: moveCount)
        
        //Now, traverse on each linked list until the pointers are same.
        while let leftNode = left, let rightNode = right {
            if left === right { return left }
            
            left = leftNode.next
            right = rightNode.next
        }
        
        return nil
        
    }
    
    private func move(_ node: inout Node?, by offset:Int) {
        var offset = offset
        while offset > 0 {
            node = node?.next
            offset -= 1
        }
    }
    
    private func countAndTail(_ node: Node?) -> (Node?, Int){
        var node = node
        var count = 0
        while let curr = node {
            count+=1
            node = curr.next
        }
        return (node, count)
    }
}




func printData(_ head:Node) {
     
     var curr = head
     while let next = curr.next {
        //print(curr.data)
        print(curr.data, separator: "->", terminator: "->")
         curr = next
     }
    //print(curr.data)
    print(curr.data)

 }



var node = Node(1)
node.appendIteratively(2)
node.appendIteratively(3)
node.appendIteratively(3)
node.appendIteratively(2)
node.appendIteratively(1)


node.isPalindrome(node)
import UIKit

var str = "Hello, playground"



