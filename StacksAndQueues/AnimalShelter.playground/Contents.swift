import UIKit

class AnimalShelter {
    var dogQueue = [String]()
    var catQueue = [String]()
    var any = [String]()
    
    func enqueue(_ animal: String) {
        if animal == "D" {
            dogQueue.append(animal)
        } else if animal == "C" {
            catQueue.append(animal)
        }
        any.append(animal)
    }
    
    func dequeueAny() -> String {
        any.remove(at: 0)
    }
    
    func dequeueDog() -> String {
        dogQueue.remove(at: 0)
    }
    func dequeueCat() -> String {
        catQueue.remove(at: 0)
    }
}

var animal = AnimalShelter()
animal.enqueue("D")
animal.enqueue("C")
animal.enqueue("C")
animal.enqueue("D")
animal.enqueue("D")

animal.dequeueCat()
animal.dequeueAny()




