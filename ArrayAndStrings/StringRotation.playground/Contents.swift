import UIKit

var str1 = "waterbottle"
var str2 = "erbottlewat"

func isRotation(_ str1: String, _ str2: String) ->Bool {
    var str1 = str1
    
    guard str1.count == str2.count, str1.count > 0 else { return false }
    if str1.contains(str2) { return true }

    for char in str1 {
        let first = str1.removeFirst()
       str1.append(first)
        print(str1)
       if str1.contains(str2) { return true }
    }
    
    return false
}

extension String {
    //one call
    func isRotationOneCall(of other: String) -> Bool {
        return (self + self).contains(other)
    }
}

//isRotation(str1, str2)

assert("etcart".isRotationOneCall(of: "cartet"))
assert("cartet".isRotationOneCall(of: "etcart"))
assert("waterbottle".isRotationOneCall(of: "erbottlewat"))

public var isSubstringCallCount = 0

public func isSubstring(_ needle: String, _ haystack: String) -> Bool {
    isSubstringCallCount += 1
    return haystack.range(of: needle) != nil
}

public func isRotation3(_ s1: String, _ s2: String) -> Bool {
    return isSubstring(s1, s2 + s2)
    
}
print(isSubstringCallCount)
isRotation3(str1, str2)
