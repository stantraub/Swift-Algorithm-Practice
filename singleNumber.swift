func singleNumber(_ nums: [Int]) -> Int {
    var freq = [Int: Int]()
    
    for num in nums {
        if var exists = freq[num] {
            exists += 1
            freq[num] = exists
        } else {
            freq[num] = 1
        }
    }
    
    for (key, _) in freq {
        if freq[key] == 1 {
            return key
        }
    }
    
    return 0
}