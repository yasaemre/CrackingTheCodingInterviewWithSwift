import UIKit

func smallestDiff(_ a:[Int], _ b:[Int]) -> Int? {
    guard !a.isEmpty && !b.isEmpty else {
        return nil
    }
    
    //Once the arrays are sorted, we can find min diff by iterating through the array
    let a = a.sorted()
    let b = b.sorted()
    
    var indexA = 0
    var indexB = 0
    var diff = Int.max
    
    while indexA < a.count && indexB < b.count {
        let valueOfA = a[indexA]
        let valueOfB = b[indexB]
        
        diff = min(diff, abs(valueOfA-valueOfB))
        if valueOfA < valueOfB {
            indexA += 1
        } else if valueOfA > valueOfB {
            indexB += 1
        } else {
            return 0
        }
    }
    
    return diff
}


//This algorithm takesO(A log A + B log B)time to sort and O(A + B)time to find the minimum difference.Therefore,the overall runtime is O(A log A + B log B).

var a = [1, 2, 11, 15]
var b = [4, 12, 19, 23, 127, 235]

smallestDiff(a, b)
