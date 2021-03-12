import UIKit
//1. Work left to right
//2.Examine each item and compare it to items on its left
//3.Insert the item in the correct position in the array
var input = [12,4,54,6,1,0,-5]

func insertionSort(_ nums: inout[Int]) {
    for var i in 0..<nums.count {
        while i > 0, nums[i] < nums[i-1] {
            nums.swapAt(i, i-1)
            i -= 1
        }
    }
}

insertionSort(&input)

//TC: O(n^2) average and wors case but best case O(n), SC: O(1)
