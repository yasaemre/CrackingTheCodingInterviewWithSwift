import UIKit

var str1 = "a B ca "
var str2 = "a b ca "

func isPermutationDict(_ str1: String, _ str2: String) -> Bool {
    guard str1.count == str2.count else {
        return false
    }
    
    var dict1:[String: Int] = [:]
    var dict2:[String: Int] = [:]
    
    for char in str1 {
        dict1["\(char)", default: 0] += 1
    }
    
    for char in str2 {
        dict2["\(char)", default: 0] += 1
    }
    
    for char in str1 {
        if dict1["\(char)"] != dict2["\(char)"] {
            return false
        }
    }
     return true
}

isPermutationDict(str1, str2)

//Same char nums diff orders
func isPermutationSort(_ str1:String, _ str2: String) -> Bool {
    
    let str1 = str1.sorted()
    let str2 = str2.sorted()
    
    print(str2)
    for i in 0..<str1.count {
        if str1[i] != str2[i] {
            return false
        }
    }
    
    
    return true
}

var str3 = "6666"
var str4 = "adnknmcb"

isPermutationSort(str3, str4)
