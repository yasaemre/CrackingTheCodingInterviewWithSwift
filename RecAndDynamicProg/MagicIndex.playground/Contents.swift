import UIKit

var str = "Hello, playground"

func magicFast(_ arr: [Int]) -> Int {
    return magicFastHelper(arr, 0, arr.count-1)
}

func magicFastHelper(_ arr: [Int], _ start: Int, _ end: Int) -> Int{
    if end < start {
        return -1
    }
    var mid = (start + end) / 2
    if arr[mid] == mid {
        return arr[mid]
    } else if arr[mid] > mid {
        return magicFastHelper(arr, 0, mid-1)
    } else {
        return magicFastHelper(arr, mid + 1, end)
    }
}


var arr = [0,1,2,3,4,5,6,7,8]
magicFast(arr)


func magicIndex(_ array:[Int]) -> Int {
    return magicIndexHelper(array, 0, array.count - 1)
}

func magicIndexHelper(_ array: [Int], _ start:Int, _ end:Int) -> Int{
    if end < start {
        return -1
    }
    
    let midInd = (start+end)/2
    let midVal = array[midInd]
    
    if midInd == midVal {
        return midInd
    }
    
    //Seach left
    let leftIndex = min(midInd-1, midVal)
    let left = magicIndexHelper(array,start,leftIndex)
    if left >= 0 {
        return left
    }
    
    //Search right
    let rightIndex = max(midInd+1, midVal)
    let right = magicIndexHelper(array, rightIndex, end)
    
    return right
}

magicIndex(arr)

