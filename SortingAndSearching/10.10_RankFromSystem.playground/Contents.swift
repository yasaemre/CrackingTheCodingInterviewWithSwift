import UIKit

/*
 Imagine you are readsing in a stream of integers. Periodically, you wish to be able to look up th rank of number x(the num of the values less than or equal to x). Implement the data structures and algorithms to support these operations. That is, implement the method the track(x:Int), which is called when each number is generated, and the method getRankOfNumber(x:Int), which returns the number of values less than or equal to x(not including iteself.)
 */

/*
 Naive solution would be to loop through the array and check to see if any num available which is lees than or equal to x, as soon as you see the number increment the counter. This solution would be O(n) time complexity.
 
 But the book suggests us to implement balanced binary search tree in order for nodes to keep relative ordering, as well as updating new elements
 
 track method will be O(logn) time.
 */

public class RankNode{
    
    var leftSize = 0
    var left, right: RankNode?
    var data = 0
    
    init(_ d:Int) {
        self.data = d
    }
    
    func insert(d:Int) {
        if d <= data {
            if left != nil {
                left?.insert(d: d)
            }
            else {
                left = RankNode(d)
                leftSize += 1
            }
        } else {
            if right != nil {
                right?.insert(d: d)
            } else {
                right = RankNode(d)
            }
        }
    }
    
    func getRank(d:Int) -> Int {
        if d == data {
            return leftSize
        } else if d < data {
            if left == nil {
                return -1
            } else {
                return (left?.getRank(d: d))!
            }
        } else {
            let right_rank = right == nil ? -1 : right?.getRank(d: d)
            if right_rank == -1 {
                return -1
            } else {
                return leftSize + 1 + right_rank!
            }
        }
    }
}
var root:RankNode?
func track(num:Int) {
    if root == nil {
        root = RankNode(num)
    } else {
        root?.insert(d: num)
    }
}

func getRankOfNumber(num:Int) -> Int {
    return (root?.getRank(d: num))!
}

//The track method and the getRankOfNumber method will both operate in O(logn) on a balanced tree
//O(N) on an unbalanced tree which does not make sense instead of using array
