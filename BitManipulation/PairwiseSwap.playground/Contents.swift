import UIKit

//var str = "Hello, playground"
let number = 453
//radix: 2 is binary, if you wanted hex you could do radix: 16
let str = String(number, radix: 2)
print("before swap: \(str)")

func swapOddEvenBits(_ num: Int) -> Int {
    return (((num & 0xaaaaaaaa) >> 1) | ((num & 0x55555555) << 1))
}
let num2 = swapOddEvenBits(453)
let str2 = String(num2, radix: 2)
print("after swap : \(str)")

