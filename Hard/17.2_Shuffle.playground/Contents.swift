import UIKit

/*
 Wtite a method to shuffle a deck of cards. in other words, each of the 52! permutations of the deck has to be equally likely. Assume that you are given a random number generator which is perfect.
 */

//Random number between lower and higher, inclusive
func rand(_ lower:Int, _ higher:Int) -> Int {
    return lower + Int.random(in: lower...(higher-lower+1))
}

func shuffleArrayRec(_ cards:[Int], _ i:Int) -> [Int] {
    var cards:[Int] = cards
    if i == 0 { return cards }
    
    shuffleArrayRec(cards, i-1) //shuffle earlier part
    let k = rand(0, 1) // pick random index to swap with
    
    cards.swapAt(k, i)
    
    return cards
}
func shuffleIteratively(_ cards: inout [Int]){
    for i in 0..<cards.count {
        let k = rand(0, i)
        cards.swapAt(k, i)
    }
}
var cards = [1,2,3,4]
shuffleArrayRec(cards, 2)
shuffleIteratively(&cards)
