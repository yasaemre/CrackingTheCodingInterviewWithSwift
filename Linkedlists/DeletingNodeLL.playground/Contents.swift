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
node.appendIteratively(7)

var node2 = Node(1)
node2.appendRecursively(node2, 2)
node2.appendRecursively(node2, 3)
//printData(node2)

node2.removeNodeIteratively(node2, 2)
//printData(node2)
node.removeNodeRecursively(node, 4)
//print(node.data)
//printData(node)
printData(node)
