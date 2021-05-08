import UIKit

/*
 Letters and Numbers: Given an array filled with letters and numbers, find the longest subarray with an equal number of letters and numbers.
 */

//Brute Force
/*
 Just go through all subarrays, count the number of A's and B's(or letters and numbers), and find the longest one that is equal.
 Note: We can start with the longest subarray and, as soon as we find which one fits this equality condition, return it.
 */


//Check if subarray has equal number of letters and numbers
func hasEqualLetterNumbers(_ array:[Character], _ start:Int, _ end:Int) -> Bool {
    var counter = 0
    for i in start ... end {
        if array[i].isLetter {
            counter += 1
        } else if array[i].isNumber{
            counter -= 1
        }
    }
    return counter == 0
}

//Return subarray of array between start and end(inclusive)
func extractSubarray(_ array:[Character], _ start:Int, _ end:Int) -> [Character] {
    var subarray:[Character] = Array(repeating: "a", count: (end - start + 1))
    for i in start...end {
        subarray[i-start] = array[i]
    }
    return subarray
}

//Return the largest subarray with equal number of 0s and 1s.
//Look at each subarray, starting from the longest. As soon as we find the one that's equal, we return.
func findLongestSubarray(_ arr:[Character]) -> [Character] {
    var len = arr.count
    while len > 1 {
        for i in 0...arr.count-len {
            if hasEqualLetterNumbers(arr, i, i+len-1) {
                return extractSubarray(arr, i, i+len-1)
            }
        }
        len -= 1
    }
    return []
}

var charArr:[Character] = ["A", "B", "A", "A", "A", "B", "B", "B", "A", "B", "A", "A","B", "B", "A", "A", "A", "A", "A", "A"]
findLongestSubarray(charArr)
