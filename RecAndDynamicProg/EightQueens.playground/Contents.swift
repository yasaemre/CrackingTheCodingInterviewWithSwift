import UIKit

func eightQueens(_ n: Int) -> [[String]] {
    var result = [[String]]()
    var queenPositions = [(Int, Int)]()

    placeQueen(n, 0, 0, &queenPositions, &result)
    return result
}

func placeQueen(_ n: Int, _ row: Int, _ nth: Int, _ positions: inout [(Int, Int)], _ result: inout [[String]]) {
    if nth == n { // no queens left
        buildBoard(n, positions, &result)
        return
    }

    for col in 0..<n {
        if isValid(row, col, positions) {
            positions.append((row, col))
            placeQueen(n, row + 1, nth + 1, &positions, &result)
            positions.popLast()!
        }
    }
}

func isValid(_ row: Int, _ col: Int, _ positions: [(Int, Int)]) -> Bool {
    for position in positions {
        let prevRow = position.0
        let prevCol = position.1
        if col == prevCol || (row + col == prevRow + prevCol) || (col - row == prevCol - prevRow) {
            return false
        }
    }
    return true // is not attacked by same column, 45 or 135 degree
}

func buildBoard(_ n: Int, _ positions: [(Int, Int)], _ result: inout [[String]]) {
    var board = [String]()
    var row = ""
    for position in positions {
        let queenCol = position.1
        for col in 0..<n {
            if queenCol == col {
                row += "Q"
            } else {
                row += "."
            }
        }
        board.append(row)
        row = ""
    }
    result.append(board)
}

print(eightQueens(4))

