import UIKit

var str = "aabcccccaaa"

func stringCompression(_ str: String) -> String {
    var result = ""
    var count = 0
    var strArr = Array(str)
    strArr.append(" ")
    for i in 0 ..< strArr.count  {
        count += 1
        if strArr[i] != strArr[i+1], strArr[i+1] == " " {
           result += "\(strArr[i])\(count)"
            if str.count < result.count {
                return str
                print("Compressed str: \(result)")
            } else {
                return result
            }
            
        } else if strArr[i] != strArr[i+1] {
           result += "\(strArr[i])\(count)"
            count = 0
        }
    }
    return result
}
//print("\(Array(str))")
stringCompression("aabcccccaaa")

extension String {
    
    func compressedString() -> String {
        guard !isEmpty else { return self }
        var compressed = "\(self[startIndex])"
        print(compressed)
        var compressions = 1
        for char in dropFirst() {
            let p = compressed.last
            if char == p {
                compressions += 1
                continue
            }
            compressed += "\(compressions)" + "\(char)"
            compressions = 1
        }
        if compressions > 1 {
            compressed += "\(compressions)"
        }
        return compressed.count < count ? compressed : self
    }
}
var s = "aabcccccaaa"
let compressed = s.compressedString()
//assert(compressed == "a2b1c5a3", "\(compressed) != a2b1c5a3")
let strCount = str.count
var chars: [Character] = Array(repeating: "_", count: strCount)



/////////////////////////////
/// Complexity: O(n) time and space
public func compress(_ str: String) -> String {
    let strCount = str.utf8.count
    var chars: [Character] = Array(repeating: "_", count: strCount)
    var current: Character? = nil
    var counter = 0
    var index = 0

    for char in str {
        if char != current {
            if counter > 0 {
                chars[index] = Character("\(counter)")
                index += 1
                if index >= strCount { return str }
            }

            chars[index] = char
            index += 1
            if index >= strCount { return str }

            current = char
            counter = 0
        }
        counter += 1
    }

    if counter > 0 {
        chars[index] = Character("\(counter)")
    }

    return String(chars.prefix(index + 1))
}

/*
 Learnings:
 - Making many String concats is not efficient
 - In C/Java, terminating String is easier, in Swift we just cut the string until index
 */
