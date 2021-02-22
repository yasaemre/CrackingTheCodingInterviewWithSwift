import UIKit

var str = "Hello, playground"
//Explain what the following expression does
//((n&(n-1)) == 0 )


//if n = abcde1000
//then n-1 = abcde0111
//n and n-1 must have no 1s common
//abcde must be all 0s, which means that n must look like this: 00001000 Then n is power of two
//Answer is ((n & ( n-1 ) == 0 ) is power of 2 or if n is 0
