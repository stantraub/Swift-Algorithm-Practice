class Program {
  // Feel free to add new properties and methods to the class.
  class MinMaxStack {
		var minMaxStack = [[String: Int]]()
		var stack = [Int]()
		
    func peek() -> Int? {
      return stack[stack.count - 1]
    }

    func pop() -> Int? {
      // Write your code here.
      minMaxStack.popLast()
			return stack.popLast()
    }

    func push(number: Int) {
      var newMinMax = ["min": number, "max": number]
			
			if let lastMinMax = minMaxStack.last {
				newMinMax["min"] = min(lastMinMax["min"]!, newMinMax["min"]!)
				newMinMax["max"] = max(lastMinMax["max"]!, newMinMax["max"]!)
			}
			
			minMaxStack.append(newMinMax)
			stack.append(number)
    }

    func getMin() -> Int? {
      // Write your code here.
			return minMaxStack.last?["min"]
    }

    func getMax() -> Int? {
      // Write your code here.
      return minMaxStack.last?["max"]
    }
  }
}