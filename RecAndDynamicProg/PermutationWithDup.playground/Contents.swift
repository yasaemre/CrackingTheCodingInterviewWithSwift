import UIKit

// Write a method to compute all permutation of a string on non-unique characters. The list of permutations should have no duplicates.

extension String {
    var allPermutations: [String] {
        var self_ = self
        var allPermutations = Set([String(self_.remove(at: startIndex))])
        
        for char in self_ {
            var permutations = Set<String>()
            for perm in allPermutations {
                for i in perm.indices {
                    var perm = perm
                    perm.insert(char, at: i)
                    guard !permutations.contains(perm) else {
                        break
                    }
                    permutations.insert(perm)
                }
                let perm = perm.appending("\(char)")
                guard !permutations.contains(perm) else { break }
                permutations.insert(perm)
            }
            allPermutations = permutations
        }
        return Array(allPermutations)
    }
}

print("123".allPermutations)
