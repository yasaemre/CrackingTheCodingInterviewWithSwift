import UIKit

/*
 Count of 2s: Write a method to count the number of 2s between O and n.
 */

//Brute Force:
//Count the number of 2 digits between 0 and n.
func numOf2sInRange(_ n:Int) -> Int {
    var count = 0
    for i in 2...n {
        //Starting at 2 is good way of begining
        count += numOf2s(i)
    }
    return count
}

func numOf2s(_ n:Int) -> Int {
    var n = n
    var count = 0
    while  n > 0 {
        if n % 10 == 2 {
            count += 1
        }
        n = n / 10
    }
    return count
}
/*
 The only interesting part is that it's probably cleaner to seperate out numberOf2s into a seperate method. This shows an eye for code cleanliness.
 */


numOf2sInRange(44)
