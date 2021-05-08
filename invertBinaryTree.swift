func invertBinaryTree(tree: BinaryTree?) {
	guard let root = tree else { return }
	swap(root)
	invertBinaryTree(tree: root.left)
	invertBinaryTree(tree: root.right)
}

func swap(_ root: BinaryTree) {
	let temp = root.left
	root.left = root.right
	root.right = temp
}