import UIKit

/*
 Given two arrays of integers, find a pair of values (one value from each array) that you
  can swap to give the two arrays the same sum.
 EXAMPLE
 Input:{4, 1, 2, 1, 1, 2}and{3, 6, 3, 3}
 Output: {1, 3}
 */

func sumSwap(_ a:[Int], _ b:[Int]) -> (Int,Int)? {
    guard !a.isEmpty && !b.isEmpty else {
        return nil
    }
    
    let sumA = a.reduce(0, +)
    let sumB = b.reduce(0, +)
    
    guard abs(sumA - sumB) % 2 == 0  else {
        return nil
    }
    
    let diff = (sumA - sumB) / 2
    return findDiffWithSorting(diff, a.sorted(), b.sorted())
    //OR
    //return findDiffWithHash(_ diff:Int, a,b)
}

/*
 This algorithm takes O(A + B)time but requires the arrays to be sorted.If the arrays aren't sorted, we can still apply this algorithm but we'd have to sort the arrays first.The overall run time would be O(A log A + B log B).
 */
func findDiffWithSorting(_ diff:Int, _ a:[Int], _ b:[Int]) -> (Int,Int)? {
    var i = 0
    var j = 0
    
    while (i<a.count && j<b.count) {
        let valA = a[i]
        let valB = b[j]
        let d = valA - valB
        if d < diff {
            i += 1
        } else if d > diff {
            j += 1
        } else {
            return(valA,valB)
        }
    }
    return nil
}

func findDiffWithHash(_ diff:Int, _ a:[Int], _ b:[Int]) -> (Int,Int)? {
    let setB: Set<Int> = Set(b)
    for val in a {
        let target = val - diff
        if setB.contains(target) {
            return (val, target)
        }
    }
    return nil
}


