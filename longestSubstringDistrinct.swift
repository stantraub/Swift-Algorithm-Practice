func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    guard k <= s.count else { return s.count }
    guard k > 0 else { return 0 }

    var charAndIndex = [Character:Int]()
    var leftPtr = 0, rightPtr = 0
    let charArray = Array(s)
    let count = charArray.count
    var result = 0
    
    while rightPtr < count {
        charAndIndex[charArray[rightPtr]] = rightPtr
        if charAndIndex.count > k {
            if let minIndex = charAndIndex.values.min() {
                // set previous left ptr to nil, and prepare for a new left ptr
                charAndIndex[charArray[minIndex]] = nil
                //shift left ptr towards right with 1 position
                leftPtr = minIndex + 1
            }
        }
        // update new length, remain the longest one versus previous one
        result = max(rightPtr - leftPtr + 1, result)
        // shift rightPtr towards right with 1 position each time
        rightPtr += 1
    }
    return result
}