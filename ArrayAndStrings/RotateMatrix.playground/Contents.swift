import UIKit



var matrixEmpty = [[Int]]()
var matrix = Array(repeating: Array(repeating: 0, count: 4), count: 4)
print(matrix)
for i in 0..<matrix.count {
    for j in 0..<matrix[1].count {
        switch i {
        case 0:
            matrix[i][j] = j + 1
        case 1:
            matrix[i][j] = 4 + j
        case 2:
            matrix[i][j] = 8 + j
        case 3:
            matrix[i][j] = 12 + j
        default:
            break
        }
        
    }
}
print(matrix)
extension RandomAccessCollection where Iterator.Element: RandomAccessCollection, Iterator.Element.Index == Index, Indices.Iterator.Element == Index {

    func rotated() -> [[Iterator.Element.Iterator.Element]] {
        precondition(matrix.count == matrix.first?.count, "matrix must be square")
        let columns = indices.reversed()
        var rotated: [[Iterator.Element.Iterator.Element]] = []
        
        for column in columns {
            var rotatedRow: [Iterator.Element.Iterator.Element] = []
            for row in self {
                rotatedRow.append(row[column])
            }
            rotated.append(rotatedRow)
        }
        return rotated
    }

}

var matrix2 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
var rotated = matrix2.rotated()
let verify = [[4, 8, 12, 16], [3, 7, 11, 15], [2, 6, 10, 14], [1, 5, 9, 13]]
assert(rotated.elementsEqual(verify) { $0 == $1 })
print("rotated matrix2 = \(rotated)")

/// Complexity: O(n^2)
public func rotate<T: Equatable>(matrix: [[T]]) -> [[T]] {
    var m = matrix

    var size = matrix.count
    var (row, col) = (0,0)

    while size > 1 {
        for i in 0..<(size-1) {
            let (r1, c1) = (row,                col + i)
            let (r2, c2) = (row + i,            col + (size - 1))
            print("size 2: \(size)")
            let (r3, c3) = (row + (size-1),     col + (size - 1) - i)
            let (r4, c4) = (row + (size-1) - i, col)

            let temp = m[r4][c4]
            m[r4][c4] = m[r3][c3]
            m[r3][c3] = m[r2][c2]
            m[r2][c2] = m[r1][c1]
            m[r1][c1] = temp
        }

        size -= 2
        (row, col) = (row + 1, col + 1)
    }

    return m
}

/**
 Learnings:
 - Realise how I struggle to convert my algo from visual to text
 */

var matrix3 = [["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]]
print("matrix3: \(matrix3)")
print("rotated matrix3: \(rotate(matrix: matrix3))")
