func quickSort(_ array: inout [Int]) -> [Int] {
	quickSortHelper(&array, 0, array.count - 1)
	return array
}

func quickSortHelper(_ array: inout [Int], _ startIdx: Int, _ endIdx: Int) {
	if startIdx >= endIdx {
		return 
	}

	var pivotIdx = startIdx
	var leftIdx = startIdx + 1
	var rightIdx = endIdx

	while rightIdx >= leftIdx {
		if array[leftIdx] > array[pivotIdx], array[rightIdx] < array[pivotIdx] {
			swap(leftIdx, rightIdx, &array)
		}
		if array[leftIdx] <= array[pivotIdx] {
			leftIdx += 1
		}
		if array[rightIdx] >= array[pivotIdx] {
			rightIdx -= 1
		}
	}

	swap(pivotIdx, rightIdx, &array)
	let leftSubarrayIsSmaller = rightIdx - 1 - startIdx < endIdx - (rightIdx + 1)
	if leftSubarrayIsSmaller {
		quickSortHelper(&array, startIdx, rightIdx - 1)
		quickSortHelper(&array, rightIdx + 1, endIdx)
	}
	else {
		quickSortHelper(&array, rightIdx + 1, endIdx)
		quickSortHelper(&array, startIdx, rightIdx - 1)
	}
}

func swap(_ i: Int, _ j: Int, _ array: inout [Int]) {
	(array[i], array[j]) = (array[j], array[i])
}