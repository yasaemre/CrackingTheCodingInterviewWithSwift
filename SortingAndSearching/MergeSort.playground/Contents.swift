import UIKit

var arr = [38,27,43,3,9,82,10]

/*
 Invented in 1945 by John von Neumann, merge sort is an efficient sorting algorithm. The idea behind merge sort is devide and
 conquer. To break up a big problem into small problems. A helpful mantra to remember  merge sort by is split first and merge after.
 */
func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    
    let midIdx = arr.count / 2
    let left = mergeSort(Array(arr[0..<midIdx]))
    print(left)
    let right = mergeSort(Array(arr[midIdx..<arr.count]))
    return merge(left,right)
}

func merge(_ left:[Int], _ right: [Int]) -> [Int] {
    var output:[Int] = []
    var lIdx = 0
    var rIdx = 0
    while lIdx < left.count, rIdx < right.count {
        if left[lIdx] < right[rIdx] {
            output.append(left[lIdx])
            lIdx += 1
        } else {
            output.append(right[rIdx])
            rIdx += 1
        }
    }
    output += rIdx == right.count ? Array(left[lIdx..<left.count]) : Array(right[rIdx..<right.count])
    return output
}

mergeSort(arr)
