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
}
func printData(_ head:Node) {
     
     var curr = head
     while let next = curr.next {
        print(curr.data)
         curr = next
     }
    print(curr.data)
 }



var node = Node(5)
node.appendIteratively(6)
node.appendIteratively(7)

var node2 = Node(1)
node2.appendRecursively(node2, 2)
node2.appendRecursively(node2, 3)
printData(node2)

//print(node.data)
//printData(node)
