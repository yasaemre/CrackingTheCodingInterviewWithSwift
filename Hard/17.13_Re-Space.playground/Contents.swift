import UIKit

/*
 Oh, no! You have accidentally removed all spaces, punctuation, and capitalization in a lengthy document. A sentence like "I reset the c omputer. It still didn't boot!" became "iresetthe c omputeritstilldidntboot''. You'll deal with the punctuation and capi­ talization later; right now you need to re-insert the spaces. Most of the words are in a dictionary but a few are not. Given a dictionary (a list of strings) and the document (a string), design an algorithm to unconcatenate the document in a way that minimizes the number of unrecognized characters.
 EXAMPLE
 Input jesslookedjustliketimherbrother
 Output:jess looked just like tim her brother (7unrecognizedcharacters)
 */


class ParseResult {
    var invalid = Int.max
    var parsed:String? = ""
    
    init(_ inv:Int, _ p:String) {
        invalid = inv
        parsed = p
    }
}

func bestSplit(_ dictionarySet:Set<String>, _ sentence:String ) -> String {
    let r:ParseResult = split(dictionarySet, sentence, 0)
    return (r == nil ? nil : r.parsed)!
}

func split(_ dictionarySet:Set<String>, _ sentence:String, _ start:Int) -> ParseResult {
    if start >= sentence.count {
        return ParseResult(0, "")
    }
    
    var bestInvalid = Int.max
    var bestParsing:String? = nil
    var partial:String = ""
    var index = start
    
    while index < sentence.count {
        let charSentence = [Character](sentence)
        let c = charSentence[index]
        partial.append(c)
        let invalid = dictionarySet.contains(partial) ? 0 : partial.count
        if invalid < bestInvalid {
            
            let result: ParseResult = split(dictionarySet, sentence, index+1)
            if invalid+result.invalid < bestInvalid {
                bestInvalid = invalid + result.invalid
                bestParsing = "\(partial) \(result.parsed)"
                if bestInvalid == 0 { break }// short circuit
            }
        }
        index += 1
    }
    return ParseResult(bestInvalid, bestParsing!)
    
}



//extension StringProtocol {
//    public subscript(offset: Index) -> Character {
//        self[index(startIndex, offsetBy: offset)]
//    }
//}
