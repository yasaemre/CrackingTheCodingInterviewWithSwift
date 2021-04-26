import UIKit

/*
 Random Set: Write a method to randomly generate a set of m integers from an array of size n. Each element must have equal probability of being chosen.
 */


/*
 We can first pull a random set of size m from the first n - 1 elements. Then, we just need to decide if array[ n] should be inserted into our subset (which would require pulling out a random element from it). An easy way to do this is to pick a randomn umber k from 0 through n.If k < m,the n insert array[n] into subset[ k]. This will both "fairly" (i.e., with proportional probability) insert array[ n] into the subset and "fairly" remove a random element from the subset.
 */
func pickMRecursively(_ original:[Int], _ m:Int, _ i:Int) -> [Int?] {
    if i + 1 == m {
        //return firs m elements of oringal
        //return original[0...m]
        
    } else if i + 1 > m {
        var subset = pickMRecursively(original, m, i-1)
        var k = Int.random(in: 0...i)
        if k < m {
            subset[k] = original[i]
        }
        return subset
    }
    return [nil]
}

func pickMIteratively(_ original:[Int], _ m:Int) -> [Int] {
    var subset = Array(repeating: 0, count: m)
    
    //fill in subset array  with first part of original array
    for i in 0 ..< m{
        subset[i] = original[i]
    }
    
    //go through the rest of the original array
    for i in m..<original.count {
        var k = Int.random(in: 0...i)
        if k < m {
            subset[k] = original[i]
        }
    }
    return subset
}

pickMIteratively([1,2,3], 2)
