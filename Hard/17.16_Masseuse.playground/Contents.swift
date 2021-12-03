import UIKit

/*
 The Masseuse: A popular masseuse receives a sequence of back-to-back appointment requests and is debating which ones to accept. She needs a 15-minute break between appointments and therefore she cannot accept any adjacent requests. Given a sequence of back-to-back appoint­ment requests (all multiples of 15 minutes, none overlap, and none can be moved), find the optimal (highest total booked minutes) set the masseuse can honor. Return the number of minutes.
 */
var massages = [30,15,60,75,45,15,15,45]
//Recursion:

func maxMinutes(_ massages: [Int]) -> Int {
    return maxMinutesHelper(massages, 0)
}

func maxMinutesHelper(_ massages:[Int], _ index:Int) -> Int {
    //Out of bounds
    if index >= massages.count { return 0 }
    
    //Best with reservation
    let bestWith = massages[index] + maxMinutesHelper(massages, index+2)
    
    //Best without reservation
    let bestWithout = maxMinutesHelper(massages, index+1)
    
    //Return best of the subarray, starting from index
    return max(bestWith, bestWithout)
}


maxMinutes(massages)
/*
 The runtime of this solution is O (2^n) because at each element we're making two choices and we do this n times (where n is the number of massages).
 The space complexity is 0(n) due to the recursive call stack.
 */


//Recursion + Memoization:

func maxMinutesMemo(_ massages: [Int]) -> Int {
    let memo = Array(repeating: 0, count: massages.count)
    return maxMinutesHelperMemo(massages, 0, memo)
}

func maxMinutesHelperMemo(_ massages:[Int], _ index: Int, _ memo:[Int]) -> Int {
    var memo = memo
    //Out of bounds
    if index >= massages.count { return 0 }
    
    if memo[index] == 0 {
        let bestWtih = massages[index] + maxMinutesHelperMemo(massages, index+2, memo)
        let bestWithout = maxMinutesHelperMemo(massages, index+1 , memo)
        memo[index] = max(bestWtih, bestWithout)
    }
    
    return memo[index]
}

maxMinutesMemo(massages)
/*
 If we drew a bigger tree, we'd see a similar pattern. The tree looks very linear, with one branch down to the left. This gives us an O(n) runtime and 0(n) space. The space usage comes from the recursive call stack as well as from the memo table.
 */


//Iterative with Optimal Time and Space
/*
 In reviewing the last solution,we can recogpize that we only use the values in the memo table for a short amount of time. Once we are several elements past an index, we never use that element's index again.
 In fact, any given index i,  we only need to know the best value from i+1 and i+2. Therefore, we can get rid of the memo table and just use two integers.
 */
func maxMinIterative(_ massages:[Int]) -> Int {
    var oneAway = 0
    var twoAway = 0
    var i = massages.count-1
    while i >= 0 {
        let bestWith = massages[i] + twoAway
        let bestWithout = oneAway
        let current = max(bestWith, bestWithout)
        twoAway = oneAway
        oneAway = current
        i -= 1
    }
    return oneAway
}
maxMinIterative(massages)
//This gives us the most optimal time and space possible: 0 (n) time and O (1) space.
/*
 Why did we look backward? It's a common technique in many problems to walk backward through an array.
 However, we can walk forward if we want. This is easier for some people to think about, and harder for others. In this case, rather than asking "What's the best set that starts with a [i] ?'; we would ask "What's the best set that ends with a [i] ?"
 */
