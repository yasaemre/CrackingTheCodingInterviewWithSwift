import UIKit

//A child is running up  a staircase with n steps and can hop either 1,2, or 3 steps at a time.
//Count the number of ways the child can run up the stairs.

//func countWays(_ n: Int) -> Int {
//    if n < 0 {
//        return 0
//    } else if n == 0 {
//        return 1
//    } else {
//        return countWays(n - 1) + countWays(n - 2) + countWays(n - 3)
//    }
//}
//
//countWays(3)

func countWays(steps: Int) -> Int {
    var results = Array<Int?>(repeating: nil, count: steps + 1)
    let result = countWays(steps: steps, results: &results)
    return result
}

private func countWays(steps: Int, results: inout [Int?]) -> Int {
    guard steps > 0 else {
        return steps < 0 ? 0:1
    }
    
    if let result = results[steps] {
        return result
    }
    
    let n1 = countWays(steps: steps-1, results: &results)
    let n2 = countWays(steps: steps-2, results: &results)
    let n3 = countWays(steps: steps-3, results: &results)
    //print("\(results[steps])")
    print("\(n1), \(n2), \(n3)")
    results[steps] = n1 + n2 + n3
    
    return results[steps]!
}

assert(countWays(steps: 3) == 4)
//print("\(countWays(steps: 3))")


public func possibleWaysToStep(n:Int) -> Int {
    var memo = [1:1, 2:2, 3: 4]
    return _possibleWaysToStep(n:n, memo: &memo)
}

func _possibleWaysToStep(n:Int, memo: inout [Int: Int]) -> Int {
    guard n > 0  else {
        return 0
    }
    
    if memo[n] == nil {
        memo[n] = _possibleWaysToStep(n: n-3, memo: &memo) + _possibleWaysToStep(n: n-2, memo: &memo) + _possibleWaysToStep(n: n-1, memo: &memo)
    }
    return memo[n]!
}

print("\(possibleWaysToStep(n: 3))")
