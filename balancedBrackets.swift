func balencedParentheses(string: String) -> Bool {
    var stack = [String]()
    
    for char in string {
        let strChar = String(char)
        if openingChars.values.contains(strChar) {
            stack.append(strChar)
        } else {
            guard let correspondingChar = openingChars[strChar], !stack.isEmpty else else { return false }
                        
            if stack[stack.count - 1] == correspondingChar {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    
    return stack.isEmpty

}