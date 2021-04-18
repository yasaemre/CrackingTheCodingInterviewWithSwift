import UIKit

/*
 You are given an array of integers (both positive and negative). Find the contiguous sequence with the largest sum. Return the sum.
 
 EXAMPLE
 Input: 2, -8, 3, -2, 4, -10
 Output:5 (i.e•, {3, -2, 4})
 */

func getMaxSum(_ array:[Int]) -> Int {
    var maxSum = 0
    var sum = 0
    for i in 0..<array.count {
        sum += array[i]
        if maxSum < sum {
            //if maxSum is lees than sum, assign sum to maxSum
            maxSum = sum
        } else if sum < 0 {
            // if sum is a negative value, no need to continue with this seqeunce
            sum = 0
        }
    }
    return maxSum
}

//alternative solution
func largestSum(_ arr:[Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    guard arr.count > 1 else {
        return arr.first!
    }
    
    var current = arr.first!
    var maxSum = arr.first!
    for val in arr.dropFirst() {
        current = max(val, current+val)
        maxSum = max(maxSum, current)
    }
    return maxSum
}

var arr = [2, -8, 3, -2, 4, -10]
largestSum(arr)
getMaxSum(arr)
