func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else { return 0 }

    var max = 0 

    func traversal(_ node: TreeNode?, _ depth: Int) {
        guard node != nil else { return }

        if depth > max {
            max = depth
        }

        traversal(node?.left, depth + 1)
        traversal(node?.right, depth + 1)

    }

    traversal(root, 1)

    return max
}