func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard !intervals.isEmpty else { return [] }

    var result = [[Int]]()
    var sortedIntervals = intervals.sorted { $0[0] < $1[0] }

    for interval in sortedIntervals {
        // check if end time is less than start time of current interval, if it is, then append to result
        if result.isEmpty || result[result.count - 1][1] < interval[0] {
            result.append(interval)
        } else {
            // update end time of last result subarray to the greater of the current end time or current interval end time
            result[result.count - 1][1] = max(result[result.count - 1][1], interval[1])
        }
    }

    return result 
}