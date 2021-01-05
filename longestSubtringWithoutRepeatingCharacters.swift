func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count <= 1 { 
        return s.count
    }

    var longest = 0
    var strArr = Array(s)
    var seenChars = [Character: Int]()
    var startIdx = 0

    for endIdx in stride(from: 0, to: strArr.count, by: 1) {
        let currentChar = strArr[endIdx]
        if let prevSeenChar = seenChars[currentChar] {
            if prevSeenChar >= startIdx {
                startIdx = prevSeenChar + 1
            }
        }
        seenChars[currentChar] = endIdx
        longest = max(longest, endIdx - startIdx + 1)
    }

    return longest
}