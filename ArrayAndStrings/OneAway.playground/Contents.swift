import UIKit


func oneEdidAway(_ str1: String, _ str2: String) -> Bool {
    var dict1: [String: Int] = [:]
    var dict2: [String: Int] = [:]
    var count = 1
    
    if str1.count >= str2.count {
        for char in str1 {
            dict1["\(char)", default: 0] += 1
        }
        for char in str2 {
            dict2["\(char)", default: 0] += 1
        }
        
        for char in str1 {
            if dict1["\(char)"] == dict2["\(char)"] {
                continue
            } else {
                count -= 1
            }
        }
    }
    print(count)
    if count < 0 {
        return false
    } else {
      return true
    }
}

func isOneAway(_ lhs:String, _  rhs:String) -> Bool {
    if lhs.count == rhs.count { return isOneEdit(lhs, rhs) }
    else if lhs.count + 1 == rhs.count { return isOneInsertion(rhs, lhs) }
    else if lhs.count == rhs.count + 1{ return isOneInsertion(lhs,rhs) }
    return false
}

private func isOneInsertion(_ lhs:String, _ rhs: String) -> Bool {
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < lhs.count && rightIndex < rhs.count {
        let leftChar = lhs[lhs.index(lhs.startIndex, offsetBy: leftIndex)]
        let rightChar = rhs[rhs.index(rhs.startIndex, offsetBy: rightIndex)]
        
        if leftChar == rightChar {
            leftIndex += 1
            rightIndex += 1
        } else {
            if leftIndex != rightIndex {
                return false
            }
            leftIndex += 1
        }
    }
    return true
}

private func isOneEdit(_ lhs: String, _ rhs: String) -> Bool {
    var foundEdit = false
    for (i, leftChar) in lhs.enumerated() {
        let index = rhs.index(rhs.startIndex, offsetBy: i)
        if (leftChar != rhs[index]) {
            if foundEdit {
                return false
            }
            foundEdit = true
        }
    }
    return true
}

isOneAway("bales", "pale")
