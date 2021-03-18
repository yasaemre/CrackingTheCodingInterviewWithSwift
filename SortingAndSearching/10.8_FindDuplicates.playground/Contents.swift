import UIKit

/*
 You have an array with all the numbers from 1 to N, where N is at most 32000. The array may have duplicate entries and you do not know what N is. With only 4kb of memory available, how would you print all the duplicate elements in array.
 */

/*
 We have 4 kilobytes of memory which means we can address up to 8 * 4 * 210 bits. Note that 32 * 210
 bits is greater than 32000. We can create a bit vector with 32000 bits, where each bit represents one integer.
 */

class BitSet {
    var bitset = [Int]()
    init(_ size:Int) {
        bitset = Array(repeating: 0, count: (size >> 5) + 1)// devide by 32
    }
    
    func get(_ pos: Int) -> Bool {
        let wordNum = (pos >> 5) // devide by 32
        let bitNum = (pos & 0x1F) // mod 32
        return (bitset[wordNum] & (1 << bitNum)) != 0
    }
    
    func set(_ pos:Int) {
        let wordNum = (pos >> 5) //devide by 32
        let bitNum = (pos & 0x1F) //mod 32
        bitset[wordNum] |= 1 << bitNum
    }
}

func checkDuplicates(_ arr: [Int]) {
    var bs:[BitSet] = Array(repeating: BitSet(0), count: 32000)
    for i in 0 ..< arr.count {
        var num = arr[i]
        var num0 = num-1 //bitset starts at 0, numbers start at 1
        if bs.get(num0) {
            print(num)
        } else {
            bs.set(num0)
        }
    }
}

