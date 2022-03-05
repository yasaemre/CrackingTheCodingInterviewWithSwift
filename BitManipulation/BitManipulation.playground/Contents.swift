import UIKit

//This method shifts 1 over by i bits, creating a value that looks like 00010000. 
//By performing an AND with num, we clear all bits other than the bit at bit i. 
//Finally, we compare that to 0. If that new value is not zero, then bit i must have a 1. Otherwise, bit i is a 0.
func getBit(_ num:Int, _ i: Int) -> Bool {
    return ((num & (i << i)) != 0)
}

//Set Bit shifts 1 over byi bits, creating a value like 00010000. By performing an OR with num, only the
//value at bit i will change. All other bits of the mask are zero and will not affect num
func setBit(_ num: Int, _ i:Int) -> Int {
    return num | (1 << i)
}

//This method operates in almost the reverse of setBit. 
//First, we create a number like 11101111 by creating the reverse of it (00010000) and negating it. 
//Then, we perform an AND with num. This will clear the ith bit and leave the remainder unchanged
func clearBit(_ num: Int, _ i: Int) -> Int {
    var mask:Int = ~(1 << i)
    return num & mask
}

//To set the ith bit to a valuev, we first clear the bit at position i by using a mask that looks like 11101111. 
//Then, we shift the intended value,v, left by i bits. This will create a number with bit i equal tov and all other bits equal to 0. 
//Finally, we OR these two numbers, updating the ith bit ifv is 1 and leaving it as 0 otherwise.
func updateBit(_ num: Int, _ i:Int, _ isBit1: Bool) ->Int {
    var value = isBit1 ? 1 : 0
    var mask = ~(1 << i)
    return (num&mask) | (value<<i)
}
getBit(44, 3)
setBit(11111111, 1)
clearBit(3432, 3)
var trueV = false
updateBit(44, 3, trueV)
func insert(_ insert: Int, _ i: Int, _ j:Int) -> UInt16 {
    guard j > i else { return UInt16(0)}
    var new = (insert << i) | insert
    return UInt16(new)
}
insert(35, 2, 6)
func insert2(_ num: Int, _ insert: Int, _ i:Int, _ j:Int) {
    guard j > i else { return }
    
    let leftMask = ~0 << (j+1)
    let rightMask = (1 << i) - 1
    let clearMask = leftMask | rightMask
    var result = num
    result = result & clearMask
    result = result | insert << i
}

insert2(128, 35, 2, 6)
