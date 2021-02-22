import UIKit

/*:
 8.9 Implement an algorithm to print all valid (e.g. properly opened and closed) combinations of n parenthesis.
 */

//func generateParens(_ count:Int) -> [String] {
//    var str = Array(repeating: "", count: count*2)
//    var list = [String]()
//    addParens(&list, count, count, &str, 0)
//    return list
//}
//
//func addParens(_ list: inout [String],_  leftRem:Int, _ rightRem: Int, _ str:inout [String], _ index:Int) {
//    if leftRem < 0, rightRem < leftRem  { return }
//
//    if leftRem == 0 || rightRem == 0 {
//        list.append(contentsOf: str)
//    } else {
//        str[index] = "(" // add left and recurse
//        addParens(&list, leftRem-1, rightRem, &str, index+1)
//
//        str[index] = ")" // add right and recurse
//        addParens(&list, leftRem, rightRem-1, &str, index+1)
//    }
//}
//
//
//print(generateParens(3))


public func generatePrans(_ n: Int) -> Set<String> {
    switch n {
    case ..<1:
        return []
    case 1:
        return["()"]
    default:
        let prevSet = generatePrans(n-1)
        return prevSet.reduce(into:[]) {
            result, element in
            result.insert("() \(element)")
            result.insert("(\(element))")
            result.insert("\(element)()")
        }
    }
}

print(generatePrans(3))


func combinationsOfPairsOfParentheses(count: Int) -> Set<String> {
  var allCombintations = Set(["()"])
  var level = 0
  for _ in 1..<count {
    var combinations = Set<String>()
    for s in allCombintations {
      for i in s.indices {
        level += s[i] == "(" ? 1 : -1
        if level > 0 {
          var s = s
          s.insert(contentsOf: ["(", ")"], at: s.index(after: i))
          combinations.insert(s)
        }
      }
      combinations.insert("()" + s)
    }
    allCombintations = combinations
  }
  return allCombintations
}

let setOfParens = combinationsOfPairsOfParentheses(count: 3)
let parensSorted = Array(setOfParens).sorted()
assert(parensSorted == ["((()))", "(()())", "(())()", "()(())", "()()()"])
