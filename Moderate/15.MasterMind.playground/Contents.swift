import UIKit

/*
 The computer has four slots, and each slot will contain a ball that is red (R), yellow (Y), green (G) or blue (B). For example, the computer might have RGGB (Slot #1 is red, Slots #2 and #3 are green, Slot #4 is blue).
 You, the user, are trying to guess the solution. You might, for example, guess YRGB.
 When you guess the correct color for the correct slot, you get a "hit:' If you guess a color that exists but is in the wrong slot, you get a "pseudo-hit:' Note that a slot that is a hit can never count as a pseudo-hit.
 For example, if the actual solution is RGBY and you guess GGRR , you have one hit and one pseudo­ hit
 Write a method that, given a guess and a solution, returns the number of hits and pseudo-hits.
 */


func masterMind(solution:String, guess:String) -> (Int, Int) {
    let solutionArr = Array(solution)
    let guessArr = Array(guess)
    
    guard solutionArr.count == 4 && guessArr.count == 4 else { return (-1,-1) }
    
    var hits = 0
    var psuedoHits = 0
    var solDict: [Character:Int] = [:]
    var guessDict:[Character:Int] = [:]
    
    for i in 0..<solutionArr.count {
        let char1 = solutionArr[i]
        let char2 = guessArr[i]
        
        if char1 == char2 {
            hits += 1
        } else {
            solDict[char1, default:0] += 1
            guessDict[char2, default:0] += 1
        }
    }
    
    for (char, count) in solDict {
        psuedoHits += min(guessDict[char, default: 0], count)
    }
    
    return (hits, psuedoHits)
}
