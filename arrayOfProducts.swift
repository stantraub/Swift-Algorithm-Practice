func arrayOfProducts(_ array: [Int]) -> [Int] {
	var products = [Int](repeating: 1, count: array.count)

	var leftRunningProduct = 1
	for i in 0..<array.count {
		products[i] = leftRunningProduct
		leftRunningProduct *= array[i]
	}

	var rightRunningProduct = 1
	for i in stride(from: array.count - 1, through: 0, by: -1) {
		products[i] *= rightRunningProduct
		rightRunningProduct *= array[i]
	}

	return products
}