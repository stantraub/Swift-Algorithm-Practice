func backspaceCompare(_ S: String, _ T: String) -> Bool {
    return compareHelper(string: S) == compareHelper(string: T)
}

func compareHelper(string: String) -> String {
    var stack = [Character]()
    
    for char in string {
        if char != "#" {
            stack.append(char)
        } else {
            stack.popLast()
        }
    }
    
    return String(stack)
}