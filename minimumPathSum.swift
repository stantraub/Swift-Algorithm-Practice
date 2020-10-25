func minPathSum(_ grid: [[Int]]) -> Int {
    var matrix = grid
    
    for row in matrix.indices {
        for col in matrix.indices {
            if row == 0 && col == 0 {
                continue
            } else if row == 0 {
                matrix[row][col] = matrix[row][col] + matrix[row][col - 1]
            } else if col == 0 {
                matrix[row][col] = matrix[row][col] + matrix[row - 1][col]
            } else {
                matrix[row][col] = matrix[row][col] + min(matrix[row - 1][col], matrix[row][col - 1])
            }
        }
    }
    
    return matrix[matrix.count - 1][matrix[0].count - 1]
    
}