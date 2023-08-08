/**
 # Isomorphic Strings

 ## Description

 Given two strings `s` and `t`, _determine if they are isomorphic_.

 Two strings `s` and `t` are isomorphic if the characters in `s` can be
 replaced to get `t`.

 All occurrences of a character must be replaced with another character while
 preserving the order of characters. No two characters may map to the same
 character, but a character may map to itself.

 **Example 1:**

     **Input:** s = "egg", t = "add"
     **Output:** true

 **Example 2:**

     **Input:** s = "foo", t = "bar"
     **Output:** false

 **Example 3:**

     **Input:** s = "paper", t = "title"
     **Output:** true

 **Constraints:**

   * `1 <= s.length <= 5 * 104`
   * `t.length == s.length`
   * `s` and `t` consist of any valid ascii character.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/isomorphic-strings>

 */

import XCTest

private class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var helper: [Character: Character] = [:]
        var helper2: [Character: Character] = [:]

        let s = Array(s)
        let t = Array(t)

        for idx in 0 ..< s.count {
            let char = s[idx]
            if helper[char] == nil {
                helper[char] = t[idx]
                if helper2[t[idx]] == nil {
                    helper2[t[idx]] = char
                } else {
                    return false
                }
            } else {
                if helper[char] != t[idx] {
                    return false
                }
            }
        }

        return true
    }
}

class TestSolution0205: XCTestCase {
    func test1() {
        XCTAssertTrue(Solution().isIsomorphic("egg", "add"))
    }

    func test2() {
        XCTAssertFalse(Solution().isIsomorphic("foo", "bar"))
    }

    func test3() {
        XCTAssertFalse(Solution().isIsomorphic("badc", "baba"))
    }

    func test4() {
        XCTAssertTrue(Solution().isIsomorphic("paper", "title"))
    }
}
