//
//  validParentheses.swift
//  
//
//  Created by Stanley Traub on 5/2/26.
//

// https://leetcode.com/problems/valid-parentheses/description/

func isValid(_ s: String) -> Bool {
    let strArr = Array(s)
    let openingChars: [Character: Character] = [")" : "(", "]" : "[", "}" : "{"]
    
    var stack = [Character]()
    
    for char in strArr {
        if let last = stack.last, openingChars[char] == last {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty
}
