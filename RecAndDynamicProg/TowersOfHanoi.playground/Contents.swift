import UIKit

func towerOfHanoi(_ nDisk: Int,_ from:Int, _ to:Int) -> String {
    if nDisk == 1 {
        return ("\(from) -> \(to);")
    } else {
        var sol1, sol2, sol3 : String
        var helpPeg = 6 - from - to
        sol1 = towerOfHanoi(nDisk-1, from, helpPeg)
        sol2 = "\(from) -> \(to);"
        sol3 = towerOfHanoi(nDisk-1, helpPeg, to)
        return "\(sol1) \(sol2) \(sol3)"
    }
    
}

let n = 3
var stepsToSolutions = towerOfHanoi(n, 1, 3)
for step in stepsToSolutions.split(separator: ";") {
    print("\(step)")
}
