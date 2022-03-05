import UIKit

/*
Write a function to determine the number of bits you would need to flip to convert
integer A to integer B.
EXAMPLE
Input: 29 (or: 11101), 15 (or: 01111)
Output: 2
*/

func convert(_ n:Int, _ m:Int) -> Int {
    var count = 0
    var c = n ^ m
    while c != 0 {
        count += c & 1
        c >>= 1
    }
    return count
}

convert(29, 15)
