// BFS Solution

func numIslands(_ grid: [[Character]]) -> Int {
    let dirs = [[0, 1], [1, 0], [-1, 0], [0, -1]]
    var islands = 0
    var matrix = grid

    for row in matrix.indices {
        for col in matrix[0].indices {
            if matrix[row][col] == "1" {
                islands += 1
                matrix[row][col] = "0"
                var queue = [[Int]]()
                queue.append([row,col])

                while !queue.isEmpty {
                    let pos = queue.removeFirst()
                    let currentRow = pos[0]
                    let currentCol = pos[1]

                    for dir in dirs {
                        let nextRow = currentRow + dir[0]
                        let nextCol = currentCol + dir[1]

                        if nextRow < 0 || nextRow >= matrix.count || nextCol < 0 || nextCol >= matrix[0].count  {
                            continue
                        }

                        if matrix[nextRow][nextCol] == "1" {
                            queue.append([nextRow, nextCol])
                            matrix[nextRow][nextCol] = "0"

                        }
                    }
                }
            }
        }
    }

    return islands
}

// DFS solution

func numIslands(_ grid: [[Character]]) -> Int {
    var islands = 0
    var matrix = grid 
    let dirs = [[0,1], [1, 0], [-1, 0], [0, -1]]

    func inBounds(_ row: Int, _ col: Int, _ dir: [Int]) -> Bool {
        dir[0] + row >= 0 && dir[0] + row < matrix.count 
        && dir[1] + col >= 0 && dir[1] + col < matrix[0].count
    }

    func dfs(_ row: Int, _ col: Int) {
        if matrix[row][col] != "1" {
            return 
        }
        matrix[row][col] = "0"

        dirs.forEach { dir in 
            if inBounds(dir[0], dir[1], [row, col]) {
                dfs(dir[0] + row, dir[1] + col)
            }     
        }
    }

    for row in matrix.indices {
        for col in matrix[0].indices {
            if matrix[row][col] == "1" {
                dfs(row, col)
                islands += 1
            }
        }
    }

    return islands

}