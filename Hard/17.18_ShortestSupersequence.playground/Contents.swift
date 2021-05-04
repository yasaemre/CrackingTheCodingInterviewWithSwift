import UIKit

class Range {
    private var start:Int
    private var end:Int
    
    public init (s:Int, e:Int){
        start = s
        end = e
    }
    
    func length() -> Int { return end - start + 1 }
    func getStart() -> Int { return start }
    func getEnd() -> Int { return end }
    
    func shorterThan(other:Range) -> Bool {
        return length() < other.length()
    }
    
}

//Brute Force
func shortestSuperSequence(_ bigArray:[Int], _ smallArray:[Int]) -> Range {
    var bestStart = -1
    var bestEnd = -1
    
    for i in 0..<bigArray.count {
        let end = findClosure(bigArray, smallArray, i)
        if end == -1 { break }
        if bestStart == -1 || end - i < bestEnd - bestStart {
            bestStart = i
            bestEnd = end
        }
    }
    
    return Range(s: bestStart, e: bestEnd)
}

/* Given an index, find the closure (i.e., the element which terminates a complete * subarray containing all elements in smallArray). This will be the max of the next locations of each element in smallArray. */
func findClosure(_ bigArray:[Int], _ smallArray:[Int], _ index:Int) -> Int {
    var max:Int = -1
    for i in 0..<smallArray.count {
        let next:Int = findNextInstance(bigArray, smallArray[i], index)
        if next == -1 { return -1 }
        
        max = Swift.max(next, max)
    }
    
    return max
}
/* Find next instance of element starting from index. */
func findNextInstance(_ array:[Int], _ element:Int, _ index:Int) -> Int {
    for i in index..<array.count {
        if array[i] == element { return i }
    }
    return -1
}

var bigArray = [7, 5, 9, 0, 2, 1, 3, 5, 7, 9, 1, 1, 5, 8, 8, 9, 7]
var smallArray = [1, 5, 9]
var range = shortestSuperSequence(bigArray, smallArray)
print("Start: \(range.getStart()), End: \(range.getEnd())")

/*
 The slow, "easy" way to do this is to iterate through bigArray and do repeated small passes through it.
 At each index in bigArray, scan forward to find the next occurrence of each element in smallArray. The largest of these next occurrences will tell us the shortest subarray that starts at that index. (We'll call this concept"closure:'That is, the closure is the element that "closes" a complete subarray starting at that index. For example, the closure of index 3-which has value 0-in the example is index 9.)
 */
