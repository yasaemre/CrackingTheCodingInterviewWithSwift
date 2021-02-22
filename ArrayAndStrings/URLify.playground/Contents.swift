import UIKit

var input = "Mr Jr John Smith       "

func urlfy(_ input: String, _ trueLength: Int) -> String {
    var url = ""
    var spaceCount = 0
    var charCount = 0
    
    for char in input {
        if char == " " {
            spaceCount += 1
        } else {
            charCount += 1
        }
    }
    
    let remainingSpace = (spaceCount + charCount) - trueLength
    var offset = spaceCount - remainingSpace
    let inputArr = input.components(separatedBy: " ")
    
    for i in 0 ..< inputArr.count - 1 {
        if inputArr[i] == "", inputArr[i+1] == "" {
            return url
        } else {
            url += "\(inputArr[i])"
            if offset != 0 {
                url += "%20"
                offset -= 1
            }
        }
    }
    return url
}

urlfy(input, 16)
