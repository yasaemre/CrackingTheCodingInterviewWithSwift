import UIKit

/*
 Write an algorithm which computes the number of trailing zeros in factorial.
 */

//to count the number of zeros, we only need to count the pairs of multiples of 5 and 2.

//if the number is 5 of five, return which power of five. for instance, 5 -> 1, 25 -> 2
func factorsOf5(_ f:Int) -> Int {
    var count = 0
    var f = f
    while f % 5 == 0 {
        count += 1
        f /= 5
    }
    
    return count
}

func countFactZeros(_ num: Int) -> Int {
    var count = 0
    for i in 2...num {
        count += factorsOf5(i)
    }
    return count
}

//Second approach does make it more efficient by directly counting the factors of 5. Using this approach , we would first count the number of  multiples of 5 between 1 and n ( which is n/5), then the number of multiples of 25(n/25), then 125 and so on.
func countFactZeros2ndApproach(_ num:Int) -> Int {
    var count = 0
    if num < 0 { return -1 }
    var i = 5
    while num / i > 0 {
        count += num / i
        i *= 5
    }
    return count
}
countFactZeros(19)
countFactZeros2ndApproach(19)
