import UIKit

/*
 You have an integer matrix representing a plot of land, where the value at that location represents the height above sea level. A value of zero indicates water. A pond is a region of water connected vertically, horizontally, or diagonally. The size of the pond is the total number of connected water cells. Write a method to compute the sizes of all ponds in the matrix.
 
 [0, 2, 1, 0],
 [0, 1, 0, 1],
 [1, 1, 0, 1],
 [0, 1, 0, 1]
 */

public func getPondSizes(_ ponds: inout [[Int]]) -> [Int] {
    guard !ponds.isEmpty else { return [] }

    var sizes:[Int] = []
    let size = ponds.count
    for row in 0..<size {
        for col in 0..<size {
            if ponds[row][col] == 0 {
                let size = getSize(&ponds, row, col)
                sizes.append(size)
            }
        }
    }

    sizes.sort() // only because the order doesn't matter
    return sizes
}

private func getSize(_ ponds: inout [[Int]], _ row: Int, _ col: Int) -> Int {
    let isBound = (row >= 0 && col >= 0 && row < ponds.count && col < ponds.count)
    guard isBound else { return 0 }

    let isPond = (ponds[row][col] == 0)
    guard isPond else { return 0 }

    ponds[row][col] = -1

    var count = 1
    for i in row-1...row+1 {
        for j in col-1...col+1 {
            count += getSize(&ponds, i, j)
        }
    }

    return count
}

var ponds = [
    [0, 2, 1, 0],
    [0, 1, 0, 1],
    [1, 1, 0, 1],
    [0, 1, 0, 1]
]
getPondSizes(&ponds)

/*
 Another way to compute this is to think about how many times each cell is "touched" by either call. Each cell will be touched once by the computePondSizes function. Additionally, a cell might be touched once by each of its adjacent cells. This is still a constant number of touches per cell. Therefore, the overall runtime is O(N2) on an NxN matrix or, more generally, O(WH).
 */
