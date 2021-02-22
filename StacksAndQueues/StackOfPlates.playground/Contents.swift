import UIKit

/*

 Implements a SetOfStacks data structure that handles pushing elements onto the stack when the count of elements exceeds a treshhold. SetOfStacks should be composed of several stacks and should create a new stack once the previous stack exceeds its treshold. push() and pop() should behave as in a single stack.
 */

struct SetOfStacks<Element> {
    var capacity = 3
    var stack = [Element]()
    var setOfStack = [[Element]]()
    
    mutating func push(_ element: Element) {
        if stack.count < capacity {
            self.stack.append(element)
        } else {
            setOfStack.append(stack)
            stack.removeAll()
            self.stack.append(element)
        }
    }
    
    mutating func pop() {
        //var poppedStack = setOfStack.popLast()
        if var poppedStack = setOfStack.popLast() {
            if !poppedStack.isEmpty {
                poppedStack.popLast()
            }
            
        }
    }
    
    mutating func printSubStacks() {
        for stack in setOfStack {
            print(stack)
        }
    }

    
}

var newStack = SetOfStacks<Any>()
newStack.push(1)
newStack.push(2)
newStack.push(3)
newStack.push(4)
newStack.push(5)
newStack.push(6)
//newStack.push(7)
newStack.printSubStacks()

newStack.pop()

