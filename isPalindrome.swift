//
//  isPalindrome.swift
//  
//
//  Created by Stanley Traub on 5/2/26.
//

/// https://neetcode.io/problems/is-palindrome/question

func isPalindrome(_ s: String) -> Bool {
    let strArr = Array(s.lowercased())
    var p1Idx = 0
    var p2Idx = s.count - 1
    
    while p1Idx < p2Idx {
        while p1Idx < p2Idx && !strArr[p1Idx].isLetter && !strArr[p1Idx].isNumber {
            p1Idx += 1
        }
        
        while p1Idx < p2Idx && !strArr[p2Idx].isLetter && !strArr[p2Idx].isNumber {
            p2Idx -= 1
        }
        
        guard strArr[p1Idx] == strArr[p2Idx] else { return false }
        
        p1Idx += 1
        p2Idx -= 1
    }
    
    return true
}

print(isPalindrome("Was it a car or a cat I saw?"))
print(isPalindrome("tab a cat"))
print(isPalindrome("0P"))
