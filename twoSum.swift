func twoNumberSum(_ array: [Int], _ targetSum: Int) -> [Int] {
    var seen = [Int: Int]()

    for (i, num) in nums.enumerated() {
        let complement = target - num
        if let j = seen[complement] {
            return [j, i]
        }
        seen[num] = i
    }
    return []
}

print(twoNumberSum([1,2,3,4,5], 8))
