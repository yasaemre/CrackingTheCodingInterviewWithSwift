import UIKit

private func clean(_ string: String) -> String {
    let charSet = CharacterSet.lowercaseLetters.inverted.union(.whitespacesAndNewlines)
    return string.components(separatedBy: charSet).joined()
}

private func asciiIndex(_ char: Character) -> Int {
    let s = String(char).unicodeScalars
    return Int(s[s.startIndex].value)
}

asciiIndex("a")
clean("  AS vvv ss")
/// Solution #1: Use dictionary
///
/// Complexity: O(n) time, O(n) space where n is number of unique char
public func isUniqueDict(_ string: String) -> Bool {
    var chars: [Character : Int] = [:]

    for char in clean(string) {
        if chars[char] != nil { return false }
        chars[char, default: 0] += 1
    }

    return true
}

/*
 
 Bitwise Operators
 Bitwise operators enable you to manipulate the individual raw data bits within a data structure. They are often used in low-level programming, such as graphics programming and device driver creation. Bitwise operators can also be useful when you work with raw data from external sources, such as encoding and decoding data for communication over a custom protocol.
 
 Swift supports all of the bitwise operators found in C, as described below.
-------------------------------------------------------------
 Bitwise NOT Operator
 The bitwise NOT operator (~) inverts all bits in a number:

 let initialBits: UInt8 = 0b00001111
 let invertedBits = ~initialBits  // equals 11110000
 
 UInt8 integers have eight bits and can store any value between 0 and 255. This example initializes a UInt8 integer with the binary value 00001111, which has its first four bits set to 0, and its second four bits set to 1. This is equivalent to a decimal value of 15.

 The bitwise NOT operator is then used to create a new constant called invertedBits, which is equal to initialBits, but with all of the bits inverted. Zeros become ones, and ones become zeros. The value of invertedBits is 11110000, which is equal to an unsigned decimal value of 240.
 
 ---------------------------------------------------------
 Bitwise AND Operator
 The bitwise AND operator (&) combines the bits of two numbers. It returns a new number whose bits are set to 1 only if the bits were equal to 1 in both input numbers:

In the example below, the values of firstSixBits and lastSixBits both have four middle bits equal to 1. The bitwise AND operator combines them to make the number 00111100, which is equal to an unsigned decimal value of 60:
 
 let firstSixBits: UInt8 = 0b11111100
 let lastSixBits: UInt8  = 0b00111111
 let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
 
 ---------------------------------------------------------------------------
 Bitwise OR Operator
 The bitwise OR operator (|) compares the bits of two numbers. The operator returns a new number whose bits are set to 1 if the bits are equal to 1 in either input number:
 
 In the example below, the values of someBits and moreBits have different bits set to 1. The bitwise OR operator combines them to make the number 11111110, which equals an unsigned decimal of 254:
 
 let someBits: UInt8 = 0b10110010
 let moreBits: UInt8 = 0b01011110
 let combinedbits = someBits | moreBits  // equals 11111110
 
 -----------------------------------------------------------
 Bitwise XOR Operator
 The bitwise XOR operator, or “exclusive OR operator” (^), compares the bits of two numbers. The operator returns a new number whose bits are set to 1 where the input bits are different and are set to 0 where the input bits are the same:
 
 In the example below, the values of firstBits and otherBits each have a bit set to 1 in a location that the other does not. The bitwise XOR operator sets both of these bits to 1 in its output value. All of the other bits in firstBits and otherBits match and are set to 0 in the output value:
 
 let firstBits: UInt8 = 0b00010100
 let otherBits: UInt8 = 0b00000101
 let outputBits = firstBits ^ otherBits  // equals 00010001
 
 -----------------------------------------------------------
 
 Bitwise Left and Right Shift Operators
 The bitwise left shift operator (<<) and bitwise right shift operator (>>) move all bits in a number to the left or the right by a certain number of places, according to the rules defined below.
 
 Bitwise left and right shifts have the effect of multiplying or dividing an integer by a factor of two. Shifting an integer’s bits to the left by one position doubles its value, whereas shifting it to the right by one position halves its value
 
 This approach is known as a logical shift.

 The illustration below shows the results of 11111111 << 1 (which is 11111111 shifted to the left by 1 place), and 11111111 >> 1 (which is 11111111 shifted to the right by 1 place). Blue numbers are shifted, gray numbers are discarded, and orange zeros are inserted:
 
 let shiftBits: UInt8 = 4   // 00000100 in binary
 shiftBits << 1             // 00001000
 shiftBits << 2             // 00010000
 shiftBits << 5             // 10000000
 shiftBits << 6             // 00000000
 shiftBits >> 2             // 00000001
 */



/// Solution #2: Use bits
///
/// Complexity: O(n) time, O(1) space
/// Int can either be Int32 or Int64 based on its platform, to make a safe assumption,
/// we only support lowercase letter in ascii which only needs 26 bit
public func isUniqueBitWise(_ string: String) -> Bool {
    let words = clean(string)
    var letter = 0

    for char in words {
        //print("asciChar : \(asciiIndex(char))")
        //print("asciInd : \(asciiIndex("a"))")
        let offset = asciiIndex(char) - asciiIndex("a")
        print("\(char)'s offset: \(offset)")
        print("\(1 << offset)")
        print("\(letter & (1 << offset))")
        print("\(char) : \(letter & (1 << offset))")
        if (letter & (1 << offset) > 0) {
            return false
        }
        print("\(letter | (1 << offset))")
        letter = letter | (1 << offset)
        print("letter : \(letter)")
        print("----------------------")
    }

    return true
}



var str = "asdff"
isUniqueBitWise(str)


func isUniqueSet(str: String) -> Bool {
    var set = Set<String>()
    for char in str {
        if !set.contains("\(char)") {
            set.insert("\(char)")
        } else {
            return false
        }
        
    }
    return true
}
isUniqueSet(str: str)
assert(str.count  > 0)
