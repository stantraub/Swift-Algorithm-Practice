func orangesRotting(_ grid: [[Int]]) -> Int {
    func orangesRotting(_ grid: [[Int]]) -> Int {
         var grid = grid
         var fresh = 0
         var rotten = [[Int]]()
         
         for row in 0..<grid.count {
             for col in 0..<grid[0].count {
                 if grid[row][col] == 1 {
                     fresh += 1
                 } else if grid[row][col] == 2 {
                     rotten.append([row, col])
                 }
             }
         }

         let dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
         var minTime = 0

         while !rotten.isEmpty {
             let queue = rotten
             rotten = []

             for pos in queue {
                 for dir in dirs {
                     let nextRow = pos[0] + dir[0]
                     let nextCol = pos[1] + dir[1]

                     if inBounds(row: nextRow, col: nextCol, grid: grid) {
                         if grid[nextRow][nextCol] == 1 {
                             grid[nextRow][nextCol] = 2
                             fresh -= 1
                             rotten.append([nextRow, nextCol])
                         }
                     }
                 }
             }

             if !rotten.isEmpty {
                 minTime += 1
             }
         }

         return fresh == 0 ? minTime : -1
     }

     func inBounds(row: Int, col: Int, grid: [[Int]]) -> Bool {
         row >= 0 && row < grid.count && col >= 0 && col < grid[0].count
     }
}
