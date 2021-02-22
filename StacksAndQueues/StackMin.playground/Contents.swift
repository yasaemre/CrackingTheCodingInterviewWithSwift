import UIKit

var str = "Hello, playground"

class Stack {
    var stack = [Int]()
    
    func push(_ num: Int) {
        if stack.isEmpty { stack.append(num) }
        else {
            
                stack.insert(num, at: 0)
            
        }
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func min() -> Int {
        stack.first ?? -1
    }
    
    func printElements() {
        for ele in stack {
            print(ele)
        }
    }
}

var arr = Stack()

arr.push(4)
arr.push(2)
arr.push(0)
arr.printElements()

arr.min()
