class Program {
  func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
    var triplets = [[Int]]()
		
		for i in stride(from: 0, to: array.count - 2, by: 1) {
			var left = i + 1
			var right = array.count - 1
			
			while left < right {
				let currentSum = array[i] + array[left] + array[right] 
				
				if currentSum == targetSum {
					triplets.append([array[i], array[left], array[right]])
					left += 1
					right -= 1
				}
				else if currentSum < targetSum {
					left += 1
				}
				else {
					right -= 1
				}
			}
		}
		
    return triplets
  }
}