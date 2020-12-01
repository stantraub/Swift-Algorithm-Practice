func quickSelect(_ array: [Int], _ k: Int) -> Int? {
	let position = k - 1
	var startIndex = 0
	var endIndex = array.count - 1
	var variableArray = array
	return quickSelectHelper(&variableArray, &startIndex, &endIndex, position)
}

func quickSelectHelper(_ array: inout [Int], _ startIdx: inout Int, _ endIdx: inout Int, _ position: Int) -> Int {
	while true {
		var pivotIdx = startIdx
		var leftIdx = startIdx + 1
		var rightIdx = endIdx

		while leftIdx <= rightIdx {
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

		if rightIdx == position {
			return array[rightIdx]
		} else if rightIdx < position {
			startIdx = rightIdx + 1
		}
		else {
			endIdx = rightIdx - 1
		}
	}
}

func swap(_ i: Int, _ j: Int, _ array: inout [Int]) {
	(array[i], array[j]) = (array[j], array[i])
}