import UIKit
import Darwin
/*
 Kth Multiple: Design an algorithm to find the kth number such that the only prime factors are 3, 5, and 7. Note that 3, 5, and 7 do not have to be factors, but it should not have any other prime factors. For example, the first several multiples would be (in order) 1, 3, 5, 7, 9, 15, 21.
 */

//Brute Force
func getKthMagicNumber(_ k:Int) -> Int {
    let possibilities = allPossibleKFactors(k)
    possibilities.sorted()
    return possibilities[k]
}

func allPossibleKFactors(_ k:Int) -> [Int] {
    var values = [Int]()
    for a in 0...k {//loop 3
        let powA = Int(pow(Double(3), Double(a)))
        for b in 0...k {// loop 5
            let powB = Int(pow(Double(5), Double(b)))
            for c in 0...k {
                let powC = Int(pow(Double(7), Double(c)))
                var value = powA * powB * powC
                
                //Check for overflow
                if value < 0 || powA == Int.max || powB == Int.max || powC == Int.max {
                    value = Int.max
                }
                values.append(value)
            }
        }
    }
    return values
}

getKthMagicNumber(3)

let a: Int = 3
let b: Int = 3

let x: Int = Int(pow(Double(a),Double(b)))


/*
 What is the runtime of this approach? We have nested for loops, each of which runs for k iterations. The runtime of the allPossibleKFactors isO(k3). Then, we sort the k3 results in D(k3 log (k3)) time (which is equivalent toO(k3 log k) . This gives us a runtime ofO(k3 log k).
 There are a number of optimizations you could make to this (and better ways of handling the integer over­ flow), but honestly this algorithm is fairly slow. We should instead focus on reworking the algorithm.
 */
