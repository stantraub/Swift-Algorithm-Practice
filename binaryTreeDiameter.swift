class BinaryTree {
	var value: Int
	var left: BinaryTree?
	var right: BinaryTree?

	init(value: Int) {
		self.value = value
		left = nil
		right = nil
	}
}

class TreeInfo {
	var diameter: Int
	var height: Int

	init(_ diameter: Int, _ height: Int) {
		self.diameter = diameter
		self.height = height
	}
}

func binaryTreeDiameter(_ tree: BinaryTree) -> Int {
	return getTreeInfo(tree).diameter
}

func getTreeInfo(_ tree: BinaryTree?) -> TreeInfo {
	if tree == nil {
		return TreeInfo(0, 0)
	}

	let leftTreeInfo = getTreeInfo(tree!.left)
	let rightTreeInfo = getTreeInfo(tree!.right)

	let longestPathThroughRoot = leftTreeInfo.height + rightTreeInfo.height
	let maxDiameterSoFar = max(leftTreeInfo.diameter, rightTreeInfo.diameter)
	let currentDiameter = max(longestPathThroughRoot, maxDiameterSoFar)
	let currentHeight = 1 + max(leftTreeInfo.height, rightTreeInfo.height)

	return TreeInfo(currentDiameter, currentHeight)
}
