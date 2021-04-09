import UIKit

/*
 Write a method that finds the max of two numbers. You should not use if-else or
 any other comparison operators.
 */


//Let k equal the sign of a - b such that if a - b >= 0, then k is 1. Else, k=0
//Let k be the inverse of k.

//Flip a 1 to a 0 and a 0 to a 1
func flip(_ bit:Int) -> Int {
    return 1^bit
}

//Returns 1 if a is positive, and 0 if a is negative
func sign(_ a: Int) -> Int {
    return flip((a >> 31) & 0x1)
}

//In this case below a-b will be greater than Int.max and overflow.
//var a = Int.max - 2
//var b = -15
func getMaxNaive(_ a: Int, _ b: Int) -> Int {
    var k = sign(a-b)
    var q = flip(k)
    return a * k + b * q
}

//In this case below a-b will be greater than Int.max and overflow.
//var a = Int.max - 2
//var b = -15


//The code below implements this, using multiplication instead of if-statements.
func getMax(_ a:Int, _ b: Int) -> Int {
    var c = a-b
    var sa = sign(a) // if a >= 0, then 1 else 0
    var sb = sign(b) // if b >= 0, then 1 else 0
    var sc = sign(c) // depends on whether or not a-b overflows
    
    //Define a value k which is 1 if a>b and 0 if a<b
    //If a and b diff sign, then k = sign(a-b)
    var useSignOfA = sa ^ sb
    
    //If a and b same sign, then k = sign(a-b)
    var useSignOfC = flip(sa ^ sb)
    
    var k = useSignOfA * sa + useSignOfC * sc
    var q = flip(k) // opposite of k
    
    return a * k + b * q
}

getMax(3, 4)
