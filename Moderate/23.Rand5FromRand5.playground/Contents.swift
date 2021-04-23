import UIKit

/*
 Implement a method rand7() from given rand5(). That is, given a method that generates a random number between O and 4 (inclusive), write a method that generates a random number between O and 6 (inclusive).
 */

func rand7() -> Int {
    let rand5 = Int.random(in: 0..<5)
    while true {
        let r1 = 2 * rand5 // evens between 0 and 9
        let r2 = rand5 // used later to generate a 0 or 1
        if r2 != 4 {//has extra even num-discard extra
            let rand1 = r2 % 2 //generate 0 or 1
            let num = r1 + rand1 // will be in the range 0 to 9
            if num < 7 {
                return num
            }
        }
    }
}

rand7()

