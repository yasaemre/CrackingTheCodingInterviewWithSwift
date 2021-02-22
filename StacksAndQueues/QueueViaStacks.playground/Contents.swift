/*
 Implement a MyQueue class which implements a queue using two stacks.
 */
struct MyQueue<T> {
    var enqueueStack = [T]()
    var dequeueStack = [T]()
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ value: T) {
        enqueueStack.append(value)
    }
    
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            backFill()
        }
        return dequeueStack.popLast()
    }
    
    mutating func peek() -> T? {
        if dequeueStack.isEmpty {
            backFill()
        }
        return dequeueStack.popLast()
    }
    
    mutating func backFill() {
        while let val = enqueueStack.popLast() {
            dequeueStack.append(val)
        }
    }
}

var new = MyQueue<String>()
new.enqueue("apple")
new.enqueue("peach")
new.enqueue("berry")
new.dequeue()
new.dequeue()
