func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    guard let t1 = root1 else { return root2 }
    guard let t2 = root2 else { return root1 }

    t1.val += t2.val

    t1.left = mergeTrees(t1.left, t2.left)
    t1.right = mergeTrees(t1.right, t2.right)

    return t1 
}