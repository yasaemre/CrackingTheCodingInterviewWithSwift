import UIKit
/*
 Boolean Evaluation: Given a boolean expression consisting of the symbols 0(false),
 1(true), &(AND) | (OR), and ^(XOR), and desired boolean result value result, implement
 a function to count the number of ways of parenthesizing the expression such that it
 evaluates to result. The expression should be fully parenthsized(e.g (0)^(1)) but not
 extraneously(e.g (((0))^(1))).
 
 Example:
 countEva("1^0|0|1", false) -> 2
 countEva("0&0&0&1^1|0", true) -> 10
 */


//Brute force
func countEva(s:String, result:Bool) -> Int {
    if s.count == 0 { return 0 }
    if s.count == 1 { return stringToBool(c: s) == result ? 1 : 0 }
   
    var ways = 0
    
    for i in stride(from: 1, to: s.count, by: 2){
        let c: Character = s[i]
        let left: String = s[0..<i]
        let right:String = s[i+1..<s.count]
        
        //Evauluate each side for each result
        var leftTrue = countEva(s: left, result: true)
        var leftFalse = countEva(s: left, result: false)
        var rightTrue = countEva(s: right, result: true)
        var rightFalse = countEva(s: right, result: false)
        var total = (leftTrue + leftFalse) * (rightTrue + rightFalse)
        
        var totalTrue = 0
        if c == "^" {
            //required 1 true 1 false
            totalTrue = leftTrue * rightFalse + leftFalse * rightTrue
        } else if c == "&" {
            //required both true
            totalTrue = leftTrue * rightFalse
        } else if c == "|" {
            //required anything but false
            totalTrue = leftTrue * rightTrue + leftFalse * rightTrue + leftTrue * rightFalse
        }
        var subWays = result ? totalTrue : total - totalTrue
        ways += subWays
    }
    return ways
}

func stringToBool(c:String) -> Bool {
    return c.elementsEqual("1") ? true : false
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
//to get string char
extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}


countEva(s: "0&0&0&1^1|0", result: true)
