func twoNumberSum(_ array: [Int], _ targetSum: Int) -> [Int] {
	var complements = Set<Int>()

	for num in array {
		let complement = targetSum - num

		if complements.contains(complement) {
			return [complement, num]
		} else {
			complements.insert(num)
		}
	}

	return []
}

print(twoNumberSum([1,2,3,4,5], 8))