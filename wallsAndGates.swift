func wallsAndGates(_ matrix: inout [[Int]]) -> [[Int]] {
    let dirs = [[0, 1], [1, 0], [-1, 0], [0, -1]]

    func inBounds(_ nextPos: [Int]) -> Bool {
        let (row, col) = (nextPos[0], nextPos[1])

        if row >= 0, row < matrix.count, col >= 0, col < matrix[0].count {
            return true
        } else {
            return false
        }
    }

    func dfs(_ coord: [Int], _ currentDistance: Int) {
        let (row, col) = (coord[0], coord[1])
        if matrix[row][col] == -1 || matrix[row][col] < currentDistance { return }

        matrix[row][col] = currentDistance

        dirs.forEach { dir in 
            let nextPos = [row + dir[0], col + dir[1]]
            if inBounds(nextPos) {
                dfs(nextPos, currentDistance + 1)
            }
        }

    }

    for row in matrix.indices {
        for col in matrix.indices {
            if matrix[row][col] == 0 {
                dfs([row, col], 0)
            }
        }
    }



    return matrix 
}

var matrix = [[Int.max, -1, 0, Int.max], 
              [Int.max, Int.max, Int.max, -1], 
              [Int.max, -1, Int.max, -1], 
              [0, -1, Int.max, Int.max]]

print(wallsAndGates(&matrix))