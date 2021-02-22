import UIKit


func multiply(_ a:Int, _ b:Int) -> Int {
    //base case
    if a == 0 || b == 0 {
        return 0
    }
    
    //base case
    if a == 1 { return b }
    
    //recursive case
    return multiply(a-1, b) + b
}
private func multiply2(_ s: Int, _ b: Int) -> Int {
    let s = min(s,b)
    let b = max(s, b)
    return multiply2Helper(s, b)
}
func multiply2Helper(_ s: Int, _ b: Int) -> Int {
    switch s {
    case 0:
        return 0
    case 1:
        return b
    default:
        let halfS = s >> 1 // devide by 2
        let half = multiply2Helper(halfS, b)
        if (s % 2) == 0 {
            return half + half
        } else {
            return half + half + b
        }
    }
}
multiply(4, 5)
multiply2(10, 4)
