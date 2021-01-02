func firstBadVersion(_ n: Int) -> Int {
    return firstBadVersionHelper(0, n)
}

func firstBadVersionHelper( _ start: Int, _ end: Int) -> Int {
    if start > end {
        return start
    }

    let mid = (start + end) / 2

    if isBadVersion(mid) {
        return firstBadVersionHelper(start, mid - 1)
    } else {
        return firstBadVersionHelper(mid + 1, end)
    }
}