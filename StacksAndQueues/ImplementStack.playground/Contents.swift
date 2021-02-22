import UIKit

struct Stack<T> {
    var stack = [T]()
    
    mutating func pop() -> T?{
        if stack.isEmpty { return nil}
        return stack.removeLast()
    }
    
     mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func peek() -> T?{
        stack.last
    }
    
    var count:Int {
        return stack.count
    }
    
    mutating func isEmpty() -> Bool {
        return stack.isEmpty
    }
}

private var stack1 = Stack<String>()

stack1.push("Emre")
stack1.push("Eva")
stack1.push("Dincer")
stack1.push("Huriye")

stack1.isEmpty()
stack1.peek()
stack1.count
stack1.pop()
stack1.peek()
