import UIKit

struct Queue<T> {
    var queue = [T]()
    
    mutating func pushBack(_ element:T){
        queue.append(element)
    }
    mutating func popFirst() ->T? {
        let element = queue.removeFirst()
        return element
    }
    mutating func peek() ->T? {
        return queue.first
    }
    
    mutating func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

var queue1 = Queue<Double>()
queue1.pushBack(1.1)
queue1.pushBack(1.2)
queue1.pushBack(1.3)

queue1.isEmpty()
queue1.peek()
queue1.popFirst()
queue1.peek()
