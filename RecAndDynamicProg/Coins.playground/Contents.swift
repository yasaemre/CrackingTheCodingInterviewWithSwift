import UIKit

/*
 Given infinite number of quarters(25 cent), dimes(10 cents), nickels(5 cents), and pennies(1 cent), write the code to calculate the number way representing n cents.
 
 */

let denoms = [25, 10, 5, 1]
func countWays(denoms: [Int],_ n: Int) -> Int {
    return countWaysHelper(denoms, 0, n)
}


func countWaysHelper(_ denoms: [Int],_ idx:Int, _ n: Int) -> Int {
    // to handle the edge case
    if n == 0 { return 1 }
    if n < 0 { return 0 }
    
    //you can possibly go out of bound
    if n > 0, idx == denoms.count {
        return 0
    }
    //first pick a coin and then discard a coin
    return countWaysHelper(denoms, idx, n - denoms[idx]) + countWaysHelper(denoms, idx + 1, n)
}


countWays(denoms: denoms, 3)
