class Node {
	var name: String
	var children: [Node]

	init(name: String) {
		self.name = name
		children = []
	}

	func addChild(name: String) -> Node {
		let childNode = Node(name: name)
		children.append(childNode)

		return self
	}

	func breadthFirstSearch(array: inout [String]) -> [String] {
		var queue = [self]

		while !queue.isEmpty {
			let curNode = queue.removeFirst()
			array.append(curNode.name)

			for child in curNode.children {
				queue.append(child)
			}
		}

		return array
	}
}