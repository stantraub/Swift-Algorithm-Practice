class Program {
  func powerset(array: [Int], index: Int? = nil) -> [[Int]] {
    var subsets = [[Int]]()
		subsets.append([])
		
		for num in array {
			for i in 0 ..< subsets.count {
				let currentSubset = subsets[i]
				subsets.append(currentSubset + [num])
			}
		}
    
		
		return subsets
  }
}
