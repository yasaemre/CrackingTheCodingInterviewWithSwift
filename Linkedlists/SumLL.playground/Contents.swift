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



var node = Node(7)
node.appendIteratively(1)
node.appendIteratively(6)

var node2 = Node(5)
node2.appendIteratively(9)
node2.appendIteratively(2)



func sumLL(_ node1: Node?, _ node2: Node?) -> Node? {
    var node1 = node1
    var node2 = node2
    var carriage = 0
    var tempSum = 0
    var firstDigit = 0
    var outputNode = Node(0)
    var dummy = outputNode
    dummy.next = outputNode
    while node1 != nil, node2 != nil {
        tempSum = node1!.data + node2!.data
        tempSum += carriage
        if tempSum > 9 {
            firstDigit = tempSum % 10
            carriage = 1
            let tempNode = Node(firstDigit)
            print(tempNode.data)
            outputNode.next = tempNode
        } else {
            carriage = 0
            let tempNode2 = Node(tempSum)
            print(tempNode2.data)
            outputNode.next = tempNode2
        }
        tempSum = 0
        outputNode = outputNode.next!
        print("outputData:\(outputNode.data)")
        node1 = node1?.next
        node2 = node2?.next
        
    }
    return dummy.next
}

//sumLL(node, node2)
printData(sumLL(node, node2)!)
