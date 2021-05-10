func minimumWaitingTime(_ queries: inout [Int]) -> Int {
    queries.sort()
    
    var totalWaitingTime = 0
    
    for (idx, duration) in queries.enumerated() {
        let queriesLeft = queries.count - (idx + 1)
        totalWaitingTime += duration * queriesLeft
    }
    
    return totalWaitingTime
}