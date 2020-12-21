func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else { return 0 }

    var max = 1
    var curNode = root

    func helper(_ node: TreeNode?, _ depth: Int) {
        guard node != nil else { return }
        
        if (depth > max) {
            max = depth
        }

        helper(node?.left, depth + 1)
        helper(node?.right, depth + 1)
    }

    helper(curNode, max)
    return max
}