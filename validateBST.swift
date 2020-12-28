func isValidBST(_ root: TreeNode?) -> Bool {
    return validBSTHelper(root, Int.min, Int.max)
}

func validBSTHelper(_ node: TreeNode?, _ minValue: Int, _ maxValue: Int) -> Bool {
    guard let node = node else { return true }
    
    if minValue < node.val, node.val < maxValue {
        let leftIsValid = validBSTHelper(node.left, minValue, node.val)
        let rightIsValid = validBSTHelper(node.right, node.val, maxValue)
        return leftIsValid && rightIsValid
    } else {
        return false
    }
}