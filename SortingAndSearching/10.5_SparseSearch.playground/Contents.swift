import UIKit

var strArr = ["at", "","", "","ball","","", "car", "", "", "dad", "",""]

func search(_ strArr: [String], _ str: String, _ first:Int, _ last:Int) -> Int {
    if first > last { return -1 }
    //Move mid to middle
    var mid = (first+last) / 2
    
    //if mid is empty, find the closest non-empthy string.
    if (strArr[mid].isEmpty) {
        var left = mid-1
        var right = mid+1
        while true {
            if left < first, right > last {
                return -1
            } else if right <= last, !strArr[right].isEmpty {
                mid = right
                break
            } else if left >= first, !strArr[left].isEmpty {
                mid = left
                break
            }
            
            right += 1
            left -= 1
        }
    }
    
    //Check for string and recurse if necessary
    if str.elementsEqual(strArr[mid]) {
        //found it
        return mid
    } else if (strArr[mid].compare(str).rawValue < 0) {
        //search right
        return search(strArr, str, mid+1, last)
    } else {
    //search left
    return search(strArr, str, first, mid-1)
    }
}

func search(_ strArr:[String],_ str: String) -> Int {
    if (strArr == nil || str == nil || str == "") {
        return -1
    }
    return search(strArr, str, 0, strArr.count-1)
}

search(strArr, "ball")
