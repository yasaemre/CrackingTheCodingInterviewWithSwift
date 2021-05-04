import UIKit

/*
 Imagine a histogram (bar graph). Design an algorithm to compute the volume of water it could hold if someone poured water across the top. You can assume that each histogram bar has width 1.
 */

/*
 EXAMPLE
 Input: {0,0,4,0,0,6,0,0, 3,0, 5,0,1,0,0,0} (Black bars are the histogram. Gray is water.)
 
  Output:26
 */


/*
 Go through each bar and compute the volume of water above it.
 Volume of water at a bar =
 height - min(tallest bar on left, tallest bar on right)
[where above equation is positive]
 Compute the left max in the first sweep, then sweep again to compute the right
 max, minimum of the bar heights, and the delta.
 */
 
func computeHistogramVolume(_ histo: [Int]) -> Int {
    //Get left max
    var leftMaxes = Array(repeating: 0, count: histo.count)
    var leftMax = histo[0]
    for i in 0..<histo.count {
        leftMax = max(leftMax, histo[i])
        leftMaxes[i] = leftMax
    }
    
    var sum = 0
    
    //Get right max
    var rightMax = histo[histo.count-1]
    var j = histo.count-1
    while j >= 0 {
        rightMax = max(rightMax, histo[j])
        let secondTallest = min(rightMax, leftMaxes[j])
        
        //if there is a taller things on the left and right side, and then there is a water above this bar.
        //Compute the volume and the sum
        if secondTallest > histo[j] {
            sum += secondTallest - histo[j]
        }
        j -= 1
    }
    return sum
}


//TC: O(N)
var histo = [0,0,4,0,0,6,0,0,3,0,5,0,1,0,0,0]
computeHistogramVolume(histo)
