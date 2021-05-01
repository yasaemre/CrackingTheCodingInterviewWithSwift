import UIKit

/*
 Smallest K: Design an algorithm to find the smallest K numbers in an array.
 */

//Brute force
func smallestK(_ arr:[Int], _ k:Int) -> [Int] {
    if k < 0 || k > arr.count {
        return []
    }
    
    //Sort array
    let arr = arr.sorted()
    
    //Copy first k elements
    var smallest = Array(repeating: 0, count: k)
    for i in 0..<k {
        smallest[i] = arr[i]
    }
    return smallest
}

//O(nlogn)
var arr = [2,4,1,55,5,9,6,11,345,34,44,343]
smallestK(arr, 4)
