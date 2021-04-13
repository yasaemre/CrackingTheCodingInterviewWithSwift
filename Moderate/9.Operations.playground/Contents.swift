import UIKit


/*
 Write a methods to implement the multiply, subtract, and devide operations for integers.
 The results of all of these are integers. Use only the add operator.
 */

//Subtraction

//Flip a positive sign to negative or negative sign to pos.
func negate(_ a: Int) -> Int {
    var a = a
    var neg = 0
    var newSign = a < 0 ? 1 : -1
    while a != 0 {
        neg += newSign
        a += newSign
    }
    return neg
}

/*
 If optimizing is something we value here, we can try to get a to zero faster. (For this explanation, we'll assume that a is positive.) To do this, we can first reduce a by 1, then 2, then 4, then 8, and so on. We'll call this value delta. We want store each exactl yzero.
 O(logn)
 */
func negate2(_ a: Int) -> Int {
    var a = a
    var neg = 0
    var newSign = a < 0 ? 1 : -1
    var delta = newSign

    while a != 0 {
        var differentSigns = (a + delta > 0) != (a > 0)
        
        //If delta is too big, reset it.
        if a + delta != 0 && differentSigns { delta = newSign }
        neg += delta
        a += delta
        delta += delta// double the delta
    }
    return neg
}
//Subtract 2 numbers by negating b and adding them
func minus(_ a:Int, _ b:Int) -> Int {
    return a + negate2(b)
}
//TC = O(N) time
minus(1, 100)


//Multiplication
//Multiply a by b by adding a to itself b times.
func multiply(_ a: Int, _ b:Int) -> Int {
    // algo is faster if b < a
    if a < b { return multiply(b, a)  }
    var sum = 0
    var i = abs(b)
    while i > 0 {
        sum += a
        i = minus(i, 1)
    }
    if b < 0 {
        sum = negate(sum)
    }
    return sum
        
}
multiply(4, 7)

//Division
/*
 Of the three operations, division is certainly the hardest. The good thing is that we can use the multiply, subtract, and negate methods now to implement divide.
 We are trying to compute x where X = a/b . Or, to put this another way, find x where a = bx. We've now changed the problem into one that can be stated with something we know how to do: multiplication.
 */

func divide(_ a:Int, _ b: Int) -> Int {
    if b == 0 { return -1 }
    var absA = abs(a)
    var absB = abs(b)
    
    var product = 0
    var x = 0
    while product + absB <= absA {
        //don't go past a
        product += absB
        x += 1
    }
    
    if ((a < 0 && b < 0) || (a > 0 && b > 0)) {
        return x
    } else {
        return negate2(x)
    }
}


divide(6, 2)
