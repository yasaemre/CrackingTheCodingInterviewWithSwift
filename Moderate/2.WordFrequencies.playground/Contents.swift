import UIKit

//Design a method to find the frequency of occurences of any given in a book. What if we were running this algorithm multiple times?

func wordFreq(_ word: String, from book: [String]) -> Int {
    let dict = createDic(book: book)
    let key = word.lowercased()
    return dict[key] ?? 0
}

func createDic(book: [String]) -> [String: Int] {
    var dict: [String:Int] = [:]
    
    for word in book where !word.isEmpty {
        let key = word.lowercased()
        dict[key, default: 0] += 1
    }
    
    return dict
}

wordFreq("abla", from: ["abla", "abi", "teyze", "abla"])
