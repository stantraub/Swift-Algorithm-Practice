func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else { return nil }

    if root == nil || root === p || root === q { return root }

    let left = lowestCommonAncestor(root.left, q, p)
    let right = lowestCommonAncestor(root.right, q, p)

    if left != nil, right != nil {
        return root
    }

    return left != nil ? left : right
}