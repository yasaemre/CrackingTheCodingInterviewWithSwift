import UIKit
/*:
 10.1 Given to sorted arrays A and B, merge B into A in sorted order.
 */
func mergeSortedArray(_ a: inout[Int], _ countA:Int, _ b: [Int]) {
    var idxA = countA-1
    var idxB = b.count-1
    var idxMerge = countA + b.count - 1
    
    while idxB >= 0 {
        if idxA < 0 || b[idxB] > a[idxA] {
            a[idxMerge] = b[idxMerge]
            idxB -= 1
        } else {
            a[idxMerge] = a[idxA]
            idxA -= 1
        }
        
        idxMerge -= 1
    }
}
