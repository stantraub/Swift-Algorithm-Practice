class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var matrix = grid
        var islands = [Int]()
        var size = 0
        
        func inBounds(dir: [Int], row: Int, col: Int) -> Bool {
            if row + dir[0] >= 0, row + dir[0] < grid.count, col + dir[1] >= 0, col + dir[1] < grid[0].count {
                return true
            } 
            else {
                return false
            }
        }
        
        let dirs = [[0, 1], [1, 0], [-1, 0], [0, -1]]
        
        func dfs(coord: [Int]) {
            let row = coord[0]
            let col = coord[1]
            
            if matrix[row][col] != 1 {
                return 
            }
            
            matrix[row][col] = 0
            
            size += 1
            
            for dir in dirs {
                if inBounds(dir: dir, row: row, col: col) {
                    dfs(coord: [row + dir[0], col + dir[1]])
                }
            }
        
        }
        
        for row in matrix.indices {
            for col in matrix[0].indices {
                if matrix[row][col] == 1 {
                    size = 0
                    dfs(coord: [row, col])
                    islands.append(size)
                }
            }
        }
        
        var max = 0
        
        for size in islands {
            if size > max {
                max = size
            }
        }
        
        return max

    }
}