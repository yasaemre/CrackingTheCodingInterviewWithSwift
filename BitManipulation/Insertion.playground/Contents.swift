import UIKit

var str = "Hello, playground"
func insertion(_ n: Int, _ m:Int, _ i:Int, _ j:Int) -> Int {
    var result = n
    let leftMask = ~0 << (j+1)
    let rightMask = (1<<i) - 1
    let clearMask = leftMask | rightMask
    result = result | clearMask
    result = result | m << i
    return result
}

var result = insertion(1024, 19, 2, 6)
var resultString = String(result, radix: 2)
print("R = \(resultString)")
var nString = String(1024, radix: 2)
print(nString)
var mString = String(19, radix: 2)
var endIndex = nString.index(nString.endIndex, offsetBy: -2)
var startIndex = nString.index(endIndex, offsetBy: -mString.count)
//assert(nString[startIndex..<endIndex] == mString)


public func insertBit(n: Int, m: Int, i: Int, j: Int) -> Int {
    let mask = createMask(from: i, to: j)
    let nCleared = n & mask
    let mShifted = m << i
    return nCleared | mShifted
}

private func createMask(from start: Int, to end: Int) -> Int {
    return createMask(to: start) | createMask(from: start + end)
}

private func createMask(to i: Int) -> Int {
    return (1 << i) - 1
}

private func createMask(from i: Int) -> Int {
    return ~0 << (i - 1)
}

print("\(insertBit(n: 1024, m: 19, i: 2, j: 6))")
