import UIKit

/*
 Add Without Plus: Write a function that adds two numbers. You should not use+ or any arithmetic operators.
 */

func add(_ a:Int, _ b:Int) -> Int {
    if b == 0 { return a }
    
    var sum = a ^ b //add without carry
    var carry = (a&b) << 1 //carry, but do not add
    return add(sum, carry) // recurse with some + carry
}

add(23, 14440)

//Alternative solution is to make it iteratively
func addIterative(_ a: inout Int, _ b:inout Int) -> Int {
    while b != 0 {
        var sum = a ^ b // add without carrying
        var carry = (a & b) << 1 // carry, but do not add
        a = sum
        b = carry
    }
    return a
}
var a = 4
var b = 32
addIterative(&a, &b)
