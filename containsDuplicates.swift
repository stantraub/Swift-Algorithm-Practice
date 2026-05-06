func containsDuplicate(_ nums: [Int]) -> Bool {
    var numsSet = Set<Int>()
    
    for num in nums {
        if numsSet.contains(num) {
            return true
        } else {
            numsSet.insert(num))
        }
    }
    
    return false
}
