import UIKit

//During the each iteration we'll select the smallest item from the
//unsorted partition and move it to the sorted partition.
var nums = [9,4,7,2]

func selectionSort(_ nums: inout[Int]) {
    for i in 0..<nums.count {
        var currMinIdx = i
        for j in i..<nums.count {
            if nums[j] < nums[currMinIdx] {
                currMinIdx = j
            }
        }
        nums.swapAt(i, currMinIdx)
    }
}

selectionSort(&nums)
//TC: O(n^2) SC:O(1)
