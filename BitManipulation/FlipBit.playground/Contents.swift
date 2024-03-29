import UIKit
/*
You have an integer and you can flip exactly one bit from a 0 to a 1. Write code to find the length of the longest sequence of 1s you could create.
EXAMPLE
Input: 1775 (or: 11011101111) Output: 8
*/
func flipBit(_ a:Int) -> Int {
    //if all a 1s, this is already the longest sequence.
    var b = a
    if ~b == 0 { return a}
    
    var currLength = 0
    var prevLength = 0
    var maxLength = 1 // we can always have a seq at least one
    while b != 0 {
        
        if (b & 1) == 1 {
            currLength += 1
        } else if (b & 1) == 0 {
            //current bit is 0
            prevLength = (b & 2) == 0 ? 0 : currLength
            currLength = 0
        }
        maxLength = max(prevLength + currLength + 1, maxLength)
        b = b  >> 1
    }
    return maxLength
}
//run time is O(b) b is bit, space is O(1)

flipBit(1775)
