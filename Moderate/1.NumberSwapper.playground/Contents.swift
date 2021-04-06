import UIKit

var a = 3
var b = 4
//Write a function to swap numbers in place
func swapNum(_ a: Int, _ b: Int) {
    var a = a
    var b = b
    a = a - b
    b = a + b
    a = b - a
    print("a:\(a), b:\(b)")
}
swapNum(a,b)

//XOR can be used as an alternative solution
a = a^b
b = a^b
a = a^b
print("a:\(a), b:\(b)")
//We can implement a similar solution with bir manipulation. The benefit of this solution is that it works for more data types than just integers
