import UIKit

/*
 Given any integer, print an English phrase, that describes the integer.
 */

//number = 122,321
func convertNumIntoString(_ num:Int) -> String {
    guard num != 0  else { return "Zero" }
    
    let digits = ["", "Thousand", "Million", "Billion", "Trillion"]
    
    var result = ""
    var idx = 0
    var n = num
    
    while n > 0 {
        let threes = n % 1000
        let english = translate(for: threes)
        
        if idx == 0 {
            result = english
        } else {
            result = "\(english) \(digits[idx]), \(result))"
        }
        
        n = n / 1000
        idx += 1
    }
    
    return result
}

//// translate 3 digit of num
func translate(for number:Int) -> String {
    let digits = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
                  "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let digits2 = ["", "", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    
    var result = ""
    let hundred = number / 100
    
    if hundred > 0 {
        result += "\(digits[hundred]) Hundred "
    }
    
    let remainder = number % 100
    if remainder < 20 {
        result += digits[remainder]
    } else {
        let digit2 = remainder / 10
        let digit1 = remainder % 10
        result += "\(digits2[digit2]) \(digits[digit1])"
    }
    
    return result
}


convertNumIntoString(122321345)
