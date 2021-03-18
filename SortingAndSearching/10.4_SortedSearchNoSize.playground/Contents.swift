import UIKit

class Listy {
    
    let arr = [Int]()
    var res = 0
    func elementAt(_ index:Int) -> Int{
        res = arr[index]
        return res
    }
}

func search(_ list: Listy, _ val: Int) -> Int {
    var index = 1
    while list.elementAt(index) != -1, list.elementAt(index) < val {
        index *= 2
    }
    return binarySeach(list, val, index / 2, index)
}

func binarySeach(_ list: Listy, _ val: Int, _ low:Int, _ high: Int) -> Int {
    var mid:Int
    var low = low
    var high = high
    
    while low <= high {
        mid = (low+high) / 2
        var middle = list.elementAt(mid)
        if middle > val || middle == -1 {
            high = mid-1
        } else if (middle < val) {
            low = mid+1
        } else {
            return mid
        }
    }
    return -1
}
