func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
    var adjList = [[Int]]()

    for m in manager {
        adjList.append([])
    }

    for employee in manager.indices {
        let m = manager[employee]
        if m == -1 { continue }

        adjList[m].append(employee)
    }

    return dfs(headID, adjList, informTime)
}

func dfs(_ currentID: Int, _ adjList: [[Int]], _ informTime: [Int]) -> Int {
    if adjList[currentID].count == 0 {
        return 0
    }

    var maxTime = 0
    let subordinates = adjList[currentID]

    for i in subordinates.indices {
        maxTime = max(maxTime, dfs(subordinates[i], adjList, informTime))
    }

    return maxTime + informTime[currentID]
}