func numIslands(_ grid: [[Character]]) -> Int {
    var islands = 0
    var matrix = grid 
    let dirs = [[0,1], [1, 0], [-1, 0], [0, -1]]

    func inBounds(_ row: Int, _ col: Int, _ dir: [Int]) -> Bool {
        if (dir[0] + row >= 0 && dir[0] + row < matrix.count && dir[1] + col >= 0 && dir[1] + col < matrix[0].count) {
            return true
        } else {
            return false
        }

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