import UIKit

/*
 Given a sorted array of n integers that has been rotated an unknown number of times, write the code
 to find an element in the array. You may assume that the array was originally sorted in increasing order.
 */

func search(_ a:[Int], _ l:Int, _ r:Int, _ x: Int) -> Int {
    var mid = (l+r) / 2
    if x == a[mid] {
        // found element
        return mid
    }
    
    if r < l {
        return -1
    }
    
    /*
     Either left or right half must be normally ordered. Find out
     which side is normally oredered, and then use the normally oredered
     half to figure out which side to search to find x.
     */
    
    if (a[l] < a[mid]) {
        //left is normally oredered.
        if x >= a[l] && x < a[mid] {
            return search(a, l, mid-1, x)
        } else {
            return search(a, mid+1, r, x)
        }
    } else if a[mid] < a[l] {
        //right is normally oredered.
        if x > a[mid], x <= a[r] {
            return search(a, mid+1, r, x)//search right
        } else {
            return search(a, l, mid-1, x)//search left
        }
    } else if a[l] == a[r] {
        //l and r halves is all repeats
        if a[mid] != a[r] {
            //if r side is diff, search it
            return search(a, mid+1, r, x) //search right
        } else {
            //we have to search both halves
            var result = search(a, l, mid-1, x)// search left
            if result == -1 {
                return search(a, mid+1, r, x)// search right
            } else {
                return result
            }
        }
    }
    return -1
}

var input = [15,16,19,20, 25, 1,3,4,5,7,10,14]
search(input, 0, input.count-1, 5)
