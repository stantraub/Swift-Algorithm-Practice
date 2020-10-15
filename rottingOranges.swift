func orangesRotting(_ grid: [[Int]]) -> Int {
    var rotten: Set<String> = []
    var fresh: Set<String> = []
    
    for row in grid.indices {
        for col in grid[0].indices {
            if grid[row][col] == 1 {
                fresh.insert("\(row)\(col)")
            }
            else if grid[row][col] == 2 {
                rotten.insert("\(row)\(col)")
            }
        }
    }
    
    var minutes = 0
    let dirs = [[1,0], [0, 1], [-1, 0], [0, -1]]
    
    while fresh.count > 0 {
        var infected: Set<String> = []
        
        for key in rotten {
            let rowIndex = key.index(key.startIndex, offsetBy: 0)
            let colIndex = key.index(key.startIndex, offsetBy: 1)
            let row = Int(String(key[rowIndex]))!
            let col = Int(String(key[colIndex]))!
            
            for dir in dirs {
                let nextRow = row + dir[0]
                let nextCol = col + dir[1]
                
                if fresh.contains("\(nextRow)\(nextCol)") {
                    fresh.remove("\(nextRow)\(nextCol)")
                    infected.insert("\(nextRow)\(nextCol)")
                }
            }
        }
        
        if infected.count == 0 {
            return -1
        }
        
        rotten = infected
        minutes += 1
    }
    
    
    return minutes
}