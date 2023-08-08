/**
 # Valid Parentheses

 ## Description

 Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`,
 `'['` and `']'`, determine if the input string is valid.

 An input string is valid if:

   1. Open brackets must be closed by the same type of brackets.
   2. Open brackets must be closed in the correct order.

 **Example 1:**

     **Input:** s = "()"
     **Output:** true

 **Example 2:**

     **Input:** s = "()[]{}"
     **Output:** true

 **Example 3:**

     **Input:** s = "(]"
     **Output:** false

 **Constraints:**

   * `1 <= s.length <= 104`
   * `s` consists of parentheses only `'()[]{}'`.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/valid-parentheses>

 */

import XCTest

private class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let dic: [Character: Character] = [")": "(", "]": "[", "}": "{"]

        for char in s {
            switch char {
            case "[", "{", "(":
                stack.append(char)
            default:
                let paired = dic[char]
                if stack.last == paired {
                    _ = stack.popLast()
                } else {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
}

class TestSolution0020: XCTestCase {
    func test1() {
        XCTAssertTrue(Solution().isValid("()"))
    }

    func test2() {
        XCTAssertTrue(Solution().isValid("()[]{}"))
    }

    func test3() {
        XCTAssertFalse(Solution().isValid("(]"))
    }
}
