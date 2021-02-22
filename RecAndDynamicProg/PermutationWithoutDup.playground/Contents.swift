import Foundation

var str = "Hello, playground"


extension String {
    func permutationsWithoutDup() -> [String] {
        guard let last = last else { return [""]}
        
        var permutations = ["\(last)"]
        dropLast().reversed().forEach { (c) in
            var nextPermutations = [String]()
            permutations.forEach { (permutation) in
                permutation.indices.forEach { (i) in
                    var permutation = permutation
                    permutation.insert(c, at: i)
                    print("c and i = \(c) - \(i)")

                    nextPermutations.append(permutation)
                    print("permutation = \(permutation)")
                }
                nextPermutations.append(permutation.appending("\(c)"))
                print("next permutation = \(nextPermutations)")
                print("c = \(c)")

            }
            permutations = nextPermutations
        }
        return permutations
    }
}

let s = "abc"
//s.dropLast().reversed().forEach { (c) in
//    print("\(c)")
//}
print("\(s.permutationsWithoutDup())")
