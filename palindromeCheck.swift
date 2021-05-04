func isPalindrome(string: String) -> Bool {
    var startIdx = 0 
        var endIdx = string.count - 1
        let strArr = Array(string)
        
        while startIdx <= endIdx {
            guard strArr[startIdx] == strArr[endIdx] else { return false }
            startIdx += 1
            endIdx -= 1
        }
        
    return true
}