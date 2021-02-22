import UIKit

class SortStack {
    var stack = [Int]()
    var tempStack = [Int]()
    
    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append(val)
        } else if stack[0] < val {
            stack.insert(val, at: 0)
        }
    }
    
    func pop() -> Int {
        let last = stack.popLast()
        return last!
    }
    
    func peek() -> Int {
        return stack.last!
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
}

var new = SortStack()
new.push(1)
new.push(2)
new.push(3)
new.push(4)

new.pop()

