func firstDuplicateValue(_ array: inout [Int]) -> Int {
	for value in array {
		let absValue = abs(value)
		if array[absValue - 1] < 0 {
			return absValue
		}
		array[absValue - 1] = -array[absValue - 1]
	}

	return -1
}