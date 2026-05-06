func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()

    func backtrack(curString: String, open: Int, close: Int) {
        if curString.count == n * 2 {
            result.append(curString)
            return
        }

        if open < n {
            backtrack(curString: curString + "(", open: open + 1, close: close)
        }

        if close < open {
            backtrack(curString: curString + ")", open: open, close: close + 1)
        }
    }

    backtrack(curString: "", open: 0, close: 0)
    return result
}
