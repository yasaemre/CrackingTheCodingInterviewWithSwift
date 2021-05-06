import UIKit

/*
 Max Submatrix: Given an NxN matrix of positive and negative integers, write code to find the submatrix with the largest possible sum.
 */

class Submatrix {
    private var row1, row2, col1, col2, sum:Int
    
    init(_ r1:Int, _ r2:Int, _ c1:Int, _ c2:Int, _ sum:Int) {
        row1 = r1
        row2 = r2
        col1 = c1
        col2 = c2
        self.sum = sum
    }
    
    public func getSum() ->Int {
        return sum
    }
}

class Range {
    var start, end, sum:Int
    
    init(_ start:Int, _ end:Int, sum:Int) {
        self.start = start
        self.end = end
        self.sum = sum
    }
}


func maxSubArray(_ array:[Int], _ N:Int) -> Range {
    var best:Range? = nil
    
    var start = 0
    var sum = 0
    
    for i in 0..<N {
        sum += array[i]
        if best == nil || sum > best?.sum ?? 0 {
            best = Range(start, i, sum: sum)
        }
        
        //If running_sum is < 0 no point in trying to continue the series. Reset.
        if sum < 0 {
            start = i + 1
            sum = 0
        }
    }
    return best!
}


func getMatrix(_ matrix:[[Int]]) -> Submatrix {
    var rowCount = matrix.count
    var colCount = matrix[0].count
    var best:Submatrix? = nil
    
    for rowStart in 0..<rowCount {
        var partialSum = Array(repeating: 0, count: colCount)
        
        for rowEnd in rowStart..<rowCount {
            //Add values at rowEnd
            for i in 0..<colCount {
                partialSum[i] = matrix[rowEnd][i]
            }
            
            let bestRange = maxSubArray(partialSum, colCount)
            if best == nil || (best?.getSum())! < bestRange.sum {
                best = Submatrix(rowStart, bestRange.start, rowEnd, bestRange.end, bestRange.sum)
            }
        }
    }
    return best!
}

/*
 Time complexity: O(N^3). If we have R rows and C columns, we can solve it in O(R2C) time.
 Recall the solution to the maximum subarray problem: "Given an array of integers, find the subarray with the largest sum:'We can find the maximum subarray in O(N) time. We will leverage this solution for this problem.
 Every submatrix can be represented by a contiguous sequence of rows and a contiguous sequence of columns. If we were to iterate through every contiguous sequence of rows, we would then just need to find, for each of those, the set of columns that gives us the highest sum.
 */
