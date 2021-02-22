import UIKit

var str = "Hello, playground"

var matrix = [[1, 2, 3, 4],  [5, 0, 7, 8],  [9, 10, 0, 12],  [13, 14, 15, 16]]

func zeroMatrix(_ matrix:[[Int]]) -> [[Bool]] {
    var m = Array(repeating: Array(repeating: false, count: matrix[0].count ), count: matrix.count)
    var (row, col) = (0,0)
    let rowSize = matrix.count // 5
    let colSize = matrix[0].count // 3
    for i in 0 ..< rowSize {
        for j in 0 ..< colSize {
            if matrix[i][j] == 0 {
                while col < colSize {
                    m[i][col] = true
                    col += 1
                }
                col = 0
                while row < rowSize {
                    m[row][j] = true
                    row += 1
                }
                row = 0
            }
        }
    }
    
    
    return m
}

func zero(matrix: inout [[Int]]) {
    guard !matrix.isEmpty else { return }
    
    let height = matrix.count
    let width = matrix.first!.count
    
    var isFirstRowZero = false
    var isFirstColZero = false
    
    for row in 0..<height {
        for col in 0..<width {
            let val = matrix[row][col]
            if val != 0 { continue }
            
            if row == 0 { isFirstRowZero = true }
            if col == 0 { isFirstColZero = true }
            
            matrix[row][0] = 0
            matrix[0][col] = 0
        }
    }
    
    //zeroing out
    for row in 1..<height {
        if matrix[row][0] == 0 {
            zero(row: row, for: &matrix)
        }
    }
    
    for col in 1..<width {
        if matrix[0][col] == 0 {
            zero(col: col, for: &matrix)
        }
    }
    
    if isFirstRowZero {  zero(row: 0, for: &matrix)}
    if isFirstColZero { zero(col: 0, for: &matrix)}
    
    
}

func zero(row:Int, for matrix: inout [[Int]]) {
    let height = matrix.count
    for col in 0 ..< height { matrix[row][col] = 0 }
}

func zero(col:Int, for matrix: inout [[Int]]) {
    let width = matrix.first!.count
    for row in 0 ..< width { matrix[row][col] = 0 }
}






//zero(matrix: &matrix)

print(zeroMatrix(matrix))
