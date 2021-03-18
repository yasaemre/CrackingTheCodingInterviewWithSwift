import UIKit


var matrix = [
    [15], [20], [40],[85],
    [20],[35],[80],[95],
    [30],[55], [95],[105],
    [40],[80],[100],[120]
]

func findElementsNaive(_ matrix: [[Int]], _ element: Int) -> Bool {
    var row = 0
    var col = matrix[0].count-1
    
    while row < matrix.count, col >= 0 {
        if matrix[row][col] == element {
            return true
        } else if matrix[row][col] > element {
            col -= 1
        } else {
            row += 1
        }
    }
    return false
}

findElementsNaive(matrix, 15)
