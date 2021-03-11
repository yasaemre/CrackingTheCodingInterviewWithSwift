import UIKit

var nums = [20,3,5,11,2,6]
func bubbleSort(_ nums: inout[Int]) {
    for i in 0..<nums.count {
        for j in 0..<nums.count - i - 1 {
            if nums[j] > nums[j+1] {
                nums.swapAt(j, j+1)
            }
        }
    }
}
bubbleSort(&nums)

//TC: O(n^2) average and worst case. SC:O(1)
