func containsDuplicate(_ nums: [Int]) -> Bool {
    var mySet = Set<Int>()
    
    for num in nums {
        if mySet.contains(num) {
            return true
        } else {
            mySet.insert(num)
        }
    }
    
    return false
}