import UIKit

var str = "Hello, playground"
func getBit(_ num:Int, _ i: Int) -> Bool {
    return ((num & (i << i)) != 0)
}

func setBit(_ num: Int, _ i:Int) -> Int {
    return num | (1 << i)
}
func clearBit(_ num: Int, _ i: Int) -> Int {
    var mask:Int = ~(1 << i)
    return num & mask
}
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
