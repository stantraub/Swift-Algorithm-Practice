func backspaceCompare(_ S: String, _ T: String) -> Bool {
    return compareHelper(S) == compareHelper(T)
}

func compareHelper(_ str: String) -> String {
    var arr = Array(str)
    var stack = [Character]()
    
    for ele in arr {
        if ele == "#" {
            stack.popLast()
        } else {
            stack.append(ele)
        }
    }
    
    return String(stack)
}