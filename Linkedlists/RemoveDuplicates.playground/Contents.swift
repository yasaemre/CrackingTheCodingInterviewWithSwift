import UIKit

var str = "Hello, playground"

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



var node = Node(4)
node.appendIteratively(5)
node.appendIteratively(6)
node.appendIteratively(6)
node.appendIteratively(7)
node.appendIteratively(5)

var node3 = Node(1)
node3.appendRecursively(node3, 2)
node3.appendRecursively(node3, 3)


var node2 = Node(1)
node2.appendIteratively(1)
node2.appendIteratively(1)
node2.appendIteratively(2)
node2.appendIteratively(3)
node2.appendIteratively(2)
node2.appendIteratively(5)
node2.appendIteratively(1)
//printData(node2)

//node2.removeNodeIteratively(node2, 2)
//printData(node2)
//node.removeNodeRecursively(node, 4)
//print(node.data)
//printData(node)
printData(node2)
//node.removeDuplicates(node)
//node.removeDuplicates2(node)
node.removeDupWithRunner(node2)
printData(node2)

