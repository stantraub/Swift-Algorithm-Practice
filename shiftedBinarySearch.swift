func shiftedBinarySearch(_ array: [Int], _ target: Int) -> Int {
	return shiftedBinarySearchHelper(array, target, 0, array.count - 1)
}

func shiftedBinarySearchHelper(_ array: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
	if left > right {
		return -1
	}

	let middle = (left + right) / 2
	let potentialMatch = array[middle]
	let leftNum = array[left]
	let rightNum = array[right]

	if target == potentialMatch {
		return middle
	} 
	else if leftNum <= potentialMatch {
		if target < potentialMatch, target >= leftNum {
			return shiftedBinarySearchHelper(array, target, left, middle - 1)
		} else {
			return shiftedBinarySearchHelper(array, target, middle + 1, right)
		}
	}
	else {
		if target > potentialMatch, target <= rightNum {
			return shiftedBinarySearchHelper(array, target, middle + 1, right)
		} else {
			return shiftedBinarySearchHelper(array, target, left, middle - 1)
		}
	}
}