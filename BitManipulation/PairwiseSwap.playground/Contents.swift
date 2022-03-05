import UIKit

/*
Write a program to swap odd and even bits in an integer with as few instructions as
possible (e.g., bit 0 and bit 1 are swapped, bit 2 and bit 3 are swapped, and so on).

*/
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

