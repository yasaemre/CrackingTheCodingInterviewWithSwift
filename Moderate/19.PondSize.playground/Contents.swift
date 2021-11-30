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
 Both implementations are O(WH), where W is the width of the matrix and H is the height.
 
 Note: Many people say "O(N)" or "O(N2 )'; as though N has some inherent meaning. It doesn't.
 Suppose this were a square matrix. You could describe the runtime as 0( N) or 0( N ). Both are correct, depending on what you mean by N. The runtime is O(N2 ), where N is the length of one side. Or, if N is the number of cells, it is 0(N). Be careful by what you mean by N. In fact, it might be safer to just not use N at all when there's any ambiguity as to what it could mean.
 
 Some people will miscompute the runtime to be 0(N4), reasoning that the computeSize method could take as long as O( N2 ) time and you might call it as much as 0(N2 ) times (and apparently assuming an NxN matrix, too). While those are both basically correct statements, you can't just multiply them together. That's because as a single call to computeSize gets more expensive, the number of times it is called goes down.
 
 For example, suppose the very first call to computeSize goes through the entire matrix. That might take O(N2 ) time, but then we never call computeSize again.
 */
/*
 Another way to compute this is to think about how many times each cell is "touched" by either call. Each cell will be touched once by the computePondSizes function. Additionally, a cell might be touched once by each of its adjacent cells. This is still a constant number of touches per cell. Therefore, the overall runtime is O(N2) on an NxN matrix or, more generally, O(WH).
 */
