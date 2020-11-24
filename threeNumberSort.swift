func threeNumberSort(_ array: inout [Int], _ order: [Int]) -> [Int] {
	var (firstValue, secondValue) = (order[0], order[1])

	var (firstIndex, secondIndex, thirdIndex) = (0, 0, array.count - 1)

	while secondIndex <= thirdIndex {
		let value = array[secondIndex]

		if value == firstValue {
			(array[firstIndex], array[secondIndex]) = (array[secondIndex], array[firstIndex])
			firstIndex += 1
			secondIndex += 1
		} else if value == secondValue {
			secondIndex += 1
		} else {
			(array[secondIndex], array[thirdIndex]) = (array[thirdIndex], array[secondIndex])
			thirdIndex -= 1
		}
	}

	return array
}