import UIKit

/*
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

 */

class LRUCache {
    let capacity:Int
    var head:DoublyLinkedList?
    var tail:DoublyLinkedList?
    var map = [Int:DoublyLinkedList]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        //Check the node map if its key use dictionary
        guard let node = map[key] else { return -1 }
        
        //if node is not head, the required node needs to be added to the front of DLL.
        if node !== head {
            removeNode(node)
            addToHead(node)
        }
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        //1st case, if node is already existing, updata value of node and make it as a head node
        if let  node = map[key] {
            node.value = value
            
            if node !== head {
                removeNode(node)
                addToHead(node)
            }
            return
        }
        
        //if capacity is overflowed, remove item from tail and remove it from tail and corrosponding map
        if map.count == capacity {
            map[tail!.key] = nil
            removeNode(tail!)
        }
        
        //2nd case - if item is not present, create a new item, map it to the dictionary and put it at front of DLL.
        let newNode = DoublyLinkedList(key, value)
        map[key] = newNode
        addToHead(newNode)
        
        if tail == nil {
            tail = newNode
        }
    }
    
    func addToHead(_ node:DoublyLinkedList) {
        node.next = head
        head?.prev = node
        head = node
    }
    
    func removeNode(_ node:DoublyLinkedList) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        if node === tail { tail = node.prev }
    }
}

class DoublyLinkedList {
    var key:Int
    var value:Int
    
    var next:DoublyLinkedList?
    var prev:DoublyLinkedList?
    
    init(_ key:Int, _ value:Int) {
        self.key = key
        self.value = value
    }
}
