import UIKit

/*
 MajorityElement: A majority element is an element that makes up more than half of the items in an array. Given a positive integers array, find the majority element. If there is no majority element, return -1. Do this in O(N) time and 0(1) space.
 Input: 1 2 5 9 5 9 5 5 5
 Output: 5
 */


func findMajorityElement(_ array:[Int]) -> Int {
    let candidate = getCandidate(array)
    return validate(array, candidate) ? candidate : -1
}

func getCandidate(_ array:[Int]) -> Int
{
    var majorty = 0
    var count = 0
    for num in array {
        if count == 0 { majorty = num } //No majority element in previous set
        if num == majorty {
            count += 1
        } else {
            count -= 1
        }
    }
    return majorty
}

func validate( _ array:[Int], _ majority:Int) -> Bool {
    var count = 0
    for num in array {
        if num == majority {
            count += 1
        }
    }
    
    return count > array.count / 2
}

//This algorithm runs in O(N) time, and O(1) space.
/*
 Each time we terminate the validate step, the subarray has no majority element. This means that there are at least as many non-7s as there are 7s. Although we're essentially removing this subarray from the original array, the majority element will still be found in the rest of the array-and will still have majority status. Therefore, at some point, we will discover the majority element.
 Our algorithm can now be run in two passes: one to find the possible majority element and another to vali­ date it. Rather than using two variables to count (countYes and countNo), we'll just use a single count variable that increments and decrements.
 */
var array = [1,2, 5, 9, 5, 9, 5, 5, 5,]
findMajorityElement(array)
