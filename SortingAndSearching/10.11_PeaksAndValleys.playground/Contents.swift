import Foundation

/*
 In an array of integers, a "peak" is an element which is greater than or equal to the adjacent integers and a "valley" is an element which is less than or equal to the adjacent integers. For example, in the array {5, 8, 6, 2, 3, 4, 6}, {8, 6} are peaks and {5, 2} are valleys. Given an array of integers, sort the array into an alternating sequence of peaks and valleys.
 */


//Before coding we should clarify exact algo.
/*
 1.sort the array in ascending order.
 2.Iterate through the elements, starting from index 1(not 0) and jump 2 elements at a time.
 3.At each element, swap it with previous element. Since every elements appeatr in order small <= medium <= large,
 swapping these elements will always put medium as a peak: medium <= small <= large.
 */

func sortValleyPeak(array: [Int]) -> [Int] {
    var arr = array.sorted()
    var i = 1
    while i < arr.count {
        arr.swapAt(i-1, i)
        //swap(arr: arr, left: i-1, right: i)
        print(i)
        i += 2
    }
    return arr
}

func swap(arr:[Int], left: Int, right: Int) {
    let l = left
    let r = right
    var arr = arr
    let temp = arr[r]
    arr[l] = arr[r]
    arr[r] = temp
}


var input = [5,3,1,2,3]
print(sortValleyPeak(array: input))

//TC:O(nlogn)


//Optimal Solution
func sortValleyPeak2(arr: [Int]) -> [Int] {
    var arr2 = arr
    var i = 1
    while i < arr2.count {
        var biggestIndx = maxIndex(arr: arr2, a: i-1, b: i, c: i+1)
        if i != biggestIndx {
            arr2.swapAt(i, biggestIndx)
        }
        i+=2
    }
    return arr2
}

func maxIndex(arr:[Int], a:Int, b:Int, c:Int) -> Int {
    let len = arr.count
    let aValue = a >= 0 && a < len ? arr[a] : Int.min
    let bValue = b >= 0 && b < len ? arr[b] : Int.min
    let cValue = c >= 0 && c < len ? arr[c] : Int.min
    
    
    let maxV = max(aValue, max(bValue, cValue))
    if aValue == maxV{
        return a
    } else if (bValue == maxV) { return b }
    else { return c }
    
}

var input2 = [0,1,4,7,8,9]
print(sortValleyPeak2(arr: input2))
//TO(n)
