import Foundation

/*:
 8.4 Power Set: return the set of all subsets of a set.
 */

extension Set {
  
  var allSubsets: Set<Set<Element>> {
    var allSubsets = Set<Set<Element>>([Set<Element>()])
    forEach { e in
      for subset in allSubsets {
        var setToAdd = subset
        setToAdd.insert(e)
        allSubsets.insert(setToAdd)
      }
    }
    return allSubsets
  }
}

var superSet = Set(["a", "b", "c", "d"])
var allSubsets = superSet.allSubsets
//assert(allSubsets.count == 2.pow(superSet.count))
//allSubsets.forEach { e in
//  assert(e.isSubset(of: superSet))
//}
print("\(allSubsets)")

public func allSubset<T: Comparable>(_ theSet: [T]) -> [[T]] {
    let all = theSet
    
    if all.isEmpty {
        return [Array<T>()]
    }
    
    let lastElement = all.last!
    let previousSet = allSubset(Array(all.dropLast()))
    
    let newSet: [[T]] = previousSet.map {
        var currentSet = $0
        currentSet.append(lastElement)
        return currentSet
    }
    print("newSet: \(newSet)")
    print("prevSet: \(previousSet)")
    return previousSet + newSet
}

print("\(allSubset([1,2,]))")
print("Array: \(Array([1,2].dropLast()))")
