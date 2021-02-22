import UIKit

var str = "Hello, playground"

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
