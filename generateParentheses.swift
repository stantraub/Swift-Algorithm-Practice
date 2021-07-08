func generateParenthesis(_ max: Int) -> [String] {
    var res = [String]()
    
    func backtrack(_ currentString: String, _ open: Int, _ close: Int) {
        if currentString.count == max * 2 {
            res.append(currentString)
            return
        }
        
        if open < max { backtrack(currentString + "(", open + 1, close) }
        if close < open { backtrack(currentString + ")", open, close + 1) }
    }
    
    backtrack("", 0, 0)
    return res
}