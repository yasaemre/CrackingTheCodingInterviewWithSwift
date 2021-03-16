import UIKit

var nums = [10,80,30,90,40,50,70]
func quickSortLastE(_ arr: inout [Int]) -> [Int] {
    return quickSortHelper(&arr, 0, arr.count-1)
}

func quickSortHelper(_ arr: inout [Int], _ start: Int, _ end: Int) -> [Int] {
    if start < end {
        let pivot = partition(&arr, start, end)
        quickSortHelper(&arr, start, pivot-1)
        quickSortHelper(&arr, pivot+1, end)
    }
    return arr
}

func partition(_ arr: inout[Int], _ start:Int, _ end: Int) -> Int {
    //i represents the indices of the numbers less than the pivot
    //at the end, represents where the pivot should be in the array
    var i = start
    
    //pivot will always be at the end
    let pivot = arr[end]
    print("default arr : \(arr) and pivot is \(pivot)")
    for j in start..<end {
        //if the current number is less than the pivot, we swap it with number at i, because the number at i is larger than the pivot. If it wasn't, it wouldn't have been skip over. This way, we move all numbers smaller than pivot to left side of the array.
        if arr[j] < pivot {
            arr.swapAt(i, j)
            i += 1
            print("\(arr) \(j)")
        }
    }
    //move the pivot point to its proper place
    arr.swapAt(i, end)
    return i
}

print(quickSortLastE(&nums))
