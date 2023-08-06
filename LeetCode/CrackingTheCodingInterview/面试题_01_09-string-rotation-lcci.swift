/**
# String Rotation LCCI

## Description

Given two strings, `s1` and `s2`, write code to check if `s2` is a rotation of
`s1` (e.g.,"waterbottle" is a rotation of"erbottlewat"). Can you use only one
call to the method that checks if one word is a substring of another?

**Example 1:**

    
    
    **Input:** s1 = "waterbottle", s2 = "erbottlewat"
    **Output:** True
    

**Example 2:**

    
    
    **Input:** s1 = "aa", s2 = "aba"
    **Output:** False
    



**Note:**

  1. `0 <= s1.length, s2.length <= 100000`



**Difficulty:** Easy\n
**Link**: <https://leetcode-cn.com/problems/string-rotation-lcci>

*/

import XCTest

private class Solution {
    func isFlipedString(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else { return false }
        guard !s1.isEmpty else { return true }

        return "\(s1)\(s1)".contains(s2)
    }
}

class TestSolution面试题_01_09: XCTestCase {
    func test1() {
        XCTAssertTrue(Solution().isFlipedString("waterbottle", "erbottlewat"))
    }
}
