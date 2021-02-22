import UIKit

var str = "Hello, playground"

func binaryToString(_ num:Double) -> String {
    if num >= 1 || num <= 0 {
        return "Error out of range"
    }
    var binary = ""
    binary.append(".")
    while num > 0 {
        var num2 = num
        //Setting a limit on length: 32 Characters
        if binary.count >= 32 {
            return "Error greater 32"
        }
        
        let r: Double = num2 * 2
        if r >= 1 {
            binary.append("1")
            num2 = r - 1
        } else {
            binary.append("0")
            num2 = r
        }
    }
    return binary
}

binaryToString(0.72)
