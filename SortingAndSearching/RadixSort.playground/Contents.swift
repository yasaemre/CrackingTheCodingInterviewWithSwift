import Foundation

var nums = [88, 410, 1772, 20]
/*
  Sorting Algorithm that sorts an input array of integers digit by digit.
*/

// NOTE: This implementation does not handle negative numbers
func radixSort(_ array: inout [Int] ) {
  let radix = 10  //Here we define our radix to be 10
  var done = false
  var index: Int
  var digit = 1  //Which digit are we on?
  while !done {  //While our  sorting is not completed
    done = true  //Assume it is done for now
    var buckets: [[Int]] = []  //Our sorting subroutine is bucket sort, so let us predefine our buckets
    for _ in 1...radix {
      buckets.append([])
    }

    for number in array {
      index = number / digit  //Which bucket will we access?
      buckets[index % radix].append(number)
      if done && index > 0 {  //If we arent done, continue to finish, otherwise we are done
        done = false
      }
    }

    var i = 0

    for j in 0..<radix {
      let bucket = buckets[j]
      for number in bucket {
        array[i] = number
        i += 1
      }
    }

    digit *= radix  //Move to the next digit
  }
}

radixSort(&nums)
//TC: O(nk) in the best, worst, or average case. SC: O(n+k)
/*
 Unlike comparison sorting algorithms, which cannot perform better than O(n log(n)) in the average case, radix sort has a runtime of 0( kn), where n is the number of elements and k is the number of passes of the sorting algorithm.
 */
//Source: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Radix%20Sort/radixSort.swift
