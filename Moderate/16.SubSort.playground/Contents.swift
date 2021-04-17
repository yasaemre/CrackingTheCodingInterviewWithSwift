import UIKit

/*
 Given an array of integers, write a method to find indices m and n such that if you sorted
 elements m through n , the entire array would be sorted. Minimize n such sequence).
 */

func findUnsortedSeq(_ array: [Int]) {
    //find left subsequence
    var endLeft = findEndOfLeftSubsequence(array)
    if endLeft >= array.count - 1 { return } //already sorted
    
    //find right subsequence
    var startRight = findStartOfRightSubsequence(array)
    
    //get min and max
    var maxIndex = endLeft //max of left side
    var minIndex = startRight // min of right side
    for i in endLeft+1 ..< startRight {
        if array[i] < array[minIndex] { minIndex = i }
        if array[i] > array[maxIndex] { maxIndex = i }
    }
    
    //slide left until less than array[mindIndex]
    var leftIndex = shrinkLeft(array, minIndex, endLeft)
    
    //slide right until greater than array[maxIndex]
    var rightIndex = shrinkRight(array, maxIndex, startRight)
    
    print("\(leftIndex), \(rightIndex) ")
}


func findEndOfLeftSubsequence(_ arr:[Int]) -> Int {
    for i in 1 ..< arr.count {
        if arr[i] < arr[i-1] { return i-1 }
    }
    return arr.count - 1
}

func findStartOfRightSubsequence(_ arr:[Int]) -> Int {
    for i in arr.count-2 ... 0 {
        if arr[i] > arr[i+1] { return i+1 }
    }
    return 0
}

func shrinkLeft(_ arr:[Int], _ minIndex:Int, _ start:Int) -> Int {
    var comp = arr[minIndex]
    for i in start-1 ... 0 {
        if arr[i] <= comp { return i + 1 }
    }
    
    return 0
}
func shrinkRight(_ arr:[Int], _ maxIndex:Int, _ start:Int) -> Int {
    var comp = arr[maxIndex]
    for i in start ..< arr.count {
        if arr[i] >= comp { return i-1 }
    }
    return arr.count-1
}

var arr = [1, 2, 4, 7, 10, 11, 7, 12, 6, 7, 16, 18, 19]
findUnsortedSeq(arr)
