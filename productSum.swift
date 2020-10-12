class Program {
  // Tip: You can cast each element with `as? [Any]` to check whether it is
  // an array or an integer.
  func productSum(_ array: [Any], multiplier: Int) -> Int {
  	var sum = 0
		
		for num in array {
			if let elementAsArray = num as? [Any] {
				sum += productSum(elementAsArray, multiplier: multiplier + 1)
			} else {
					sum += num as! Int
			}
		}
		
		return sum * multiplier
  }
}