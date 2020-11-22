func indexEqualsValue(_ array: [Int]) -> Int {
	var leftIndex = 0 
	var rightIndex = array.count - 1

	while leftIndex <= rightIndex {
		var middleIndex = leftIndex + (rightIndex - leftIndex) / 2
		var middleValue = array[middleIndex]

		if middleValue < middleIndex {
			leftIndex = middleIndex + 1
		} else if middleValue == middleIndex, middleIndex == 0 {
			return middleIndex
		} else if middleValue == middleIndex, array[middleIndex - 1] < middleIndex - 1 {
			return middleIndex
		} else {
			rightIndex = middleIndex - 1
		}
	}

	return -1
}