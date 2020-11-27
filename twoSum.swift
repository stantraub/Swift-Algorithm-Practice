func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
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