import UIKit

/*
 You are placing a diving board by placing a bunch of planks of wood end to end.
 There are 2 types of planks, one of lenght shorter and one of length longer. You must use exactyly K planks of wood.
 Write a method to generate all possible lengths for the diving board.
 */


//Recursive solutions
func allLengths(_ k:Int, _ shorter:Int, _ longer:Int) -> Set<Int> {
    let lengths = Set<Int>()
    getAllLengths(k, 0, shorter, longer, lengths)
    return lengths
}

func getAllLengths(_ k:Int,_ total:Int, _ shorter:Int, _ longer:Int, _ lengths:Set<Int>) {
    var lengths:Set<Int> = lengths
    if k == 0 {
        lengths.insert(total)
        return
    }
    
    getAllLengths(k-1, total+shorter, shorter, longer, lengths)
    getAllLengths(k-1, total+longer, shorter, longer, lengths)
}

//This algo takes O(2^K) time, since there are 2 choices at recursive call and we recurse to a depth of K.


//Optimal solutions
/*
 We don't actually need to go through all arrangements of planks.
 We just need to go through all unique sets of K planks (sets, not orders!).
 There are only K ways of picking K planks
 if we only have two possible types: {O of type A, K of type B}, {1 of type A, K-1 of type B}, {2 of type A, K-2 of type B}, ...
 */

func allLengths2(_ k:Int, _ shorter:Int, _ longer:Int) -> Set<Int> {
    var lengths = Set<Int>()
    for nShorter in 0...k {
        let nLonger = k - nShorter
        let length = nShorter * shorter + nLonger * longer
        lengths.insert(length)
    }
    return lengths
}
