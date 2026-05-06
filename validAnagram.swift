//
//  validAnagram.swift
//  
//
//  Created by Stanley Traub on 5/1/26.
//

// https://neetcode.io/problems/is-anagram/question?list=neetcode150


// Given two strings s and t, return true if the two strings are anagrams of each other, otherwise return false.
// An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }

    var sFreq = [Character: Int]()
    var tFreq = [Character: Int]()
    
    for char in s {
        sFreq[char, default: 0] += 1
    }
    
    for char in t {
        tFreq[char, default: 0] += 1
    }
    
    for key in sFreq {
        guard let tFreqValue = tFreq[key.key] else { return false }
        
        if tFreqValue != sFreq[key.key] {
            return false
        }
    }
    
    return true
}
