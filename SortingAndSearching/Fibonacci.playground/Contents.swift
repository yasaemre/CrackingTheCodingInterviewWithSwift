import UIKit

/*

*/

func fib1(_ n: Int) -> Int {
    var a = 1
    var b = 1
    guard n > 1 else { return a }
    
    (2...n).forEach { _ in
        (a, b) = (a + b, a)
    }
    return a
}
fib1(5)
//TC:O(n)
//SC:O(1)


/*
 Let’s say we have an awesome method multiply(imaginary method) that multiplies two matrixes and returns a resultant matrix, the algorithm will be as simple as this:
 */
//func fib2(_ n:Int) -> Int {
//    guard n > 2 else { return n }
//    
//    let M = [[1,1], [1,0]]
//    var result = M
//    
//    (1..<n).forEach { _ in
//        result = multiply(result, M)
//    }
//    return result[0][0]
//}



//func fib3(_ n: Int) -> Int {
//    var M = [[1, 1], [1, 0]]
//    guard n > 2 else { return n }
//    power(&M, n)
//    return M[0][0]
//}
//func power(_ matrix: inout [[Int]], _ n: Int) {
//    guard n > 1 else { return }
//    power(&matrix, n/2)
//    matrix = multiply(matrix, matrix)
//    if n % 2 != 0 {
//        let M = [[1, 1], [1, 0]]
//        matrix = multiply(matrix, M)
//    }
//}

/*
 Time Complexity: O(log n)
 Space Complexity: O(log n) , because of recursion stack
 */

/*
 In the code snippet above the power function tries to compute the nth power of M by squaring the(n/2)th power. However if n is odd, rounding down n/2 and squaring that power of M results in the (n-1)th power, which multiplying one more factor of M will makes up that single factor. This is for sure the fastest and most optimized algorithm we can use to get the nth fibonacci number.
 */

//Source :
//https://medium.com/swlh/fibonacci-swift-playground-f56d1ff3ea99
