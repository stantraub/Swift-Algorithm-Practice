
/// https://neetcode.io/problems/islands-and-treasure/history?list=neetcode150&submissionIndex=0

func islandsAndTreasure(_ grid: inout [[Int]]) {
    let landVal = 2147483647
    var scannedTreasures = [[Int]]()

    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 0 {
                scannedTreasures.append([row,col])
            }
        }
    }

    var queue = scannedTreasures
    var distanceTraveled = 1
    let dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]

    while !queue.isEmpty {
        let positions = queue
        queue = []

        for pos in positions {
            for dir in dirs {
                let nextRow = pos[0] + dir[0]
                let nextCol = pos[1] + dir[1]

                if inBounds(row: nextRow, col: nextCol, grid: grid) {
                    if grid[nextRow][nextCol] != -1,
                    grid[nextRow][nextCol] == landVal {
                        grid[nextRow][nextCol] = distanceTraveled
                        queue.append([nextRow, nextCol])
                    }

                }


            }
        }

        distanceTraveled += 1
    }
}

func inBounds(row: Int, col: Int, grid: [[Int]]) -> Bool {
    row >= 0 && row < grid.count && col >= 0 && col < grid[0].count
}
