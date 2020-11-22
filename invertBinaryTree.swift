func invertBinaryTree(tree: BinaryTree?) {
	if let tree = tree {
		swap(tree)
		invertBinaryTree(tree: tree.left)
		invertBinaryTree(tree: tree.right)
	}
}

func swap(_ root: BinaryTree) {
	let temp = root.left
	root.left = root.right
	root.right = temp
}