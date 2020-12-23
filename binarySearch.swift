func binarySearch(array: [Int], target: Int) -> Int {
	return binarySearchHelper(array, target, 0, array.count - 1)
}

// O(logN)
func binarySearchHelper(_ array: [Int], _ target: Int, _ leftPointer: Int, _ rightPointer: Int) -> Int {
	if leftPointer > rightPointer {
		return -1
	}

	let mid = (leftPointer + rightPointer) / 2

	if target == array[mid] {
		return mid
	}
	else if target > array[mid] {
		return binarySearchHelper(array, target, mid + 1, rightPointer)
	}
	else {
		return binarySearchHelper(array, target, leftPointer, mid - 1)
	}
}