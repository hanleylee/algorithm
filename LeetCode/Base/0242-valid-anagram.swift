/**

 # Valid Anagram

 ## Description

 Given two strings `s` and `t`, return `true` _if_ `t` _is an anagram of_ `s`
 _, and_ `false` _otherwise_.

 An **Anagram** is a word or phrase formed by rearranging the letters of a
 different word or phrase, typically using all the original letters exactly
 once.

 **Example 1:**

     **Input:** s = "anagram", t = "nagaram"
     **Output:** true

 **Example 2:**

     **Input:** s = "rat", t = "car"
     **Output:** false

 **Constraints:**

   * `1 <= s.length, t.length <= 5 * 104`
   * `s` and `t` consist of lowercase English letters.

 **Follow up:** What if the inputs contain Unicode characters? How would you
 adapt your solution to such a case?

 **Difficulty:** Easy

 **Link**: <https://leetcode-cn.com/problems/valid-anagram>

 */

import XCTest

private class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var res: [Int] = Array(repeating: 0, count: 26)
        let aAscii = Character("a").asciiValue!

        for c in s {
            let offset = Int(c.asciiValue! - aAscii)
            res[offset] += 1
        }

        for c in t {
            let offset = Int(c.asciiValue! - aAscii)
            res[offset] -= 1

            if res[offset] < 0 {
                return false
            }
        }

        return res.reduce(0, +) == 0
    }
}

class TestSolution0242: XCTestCase {
    func test1() {
        XCTAssertTrue(Solution().isAnagram("anagram", "nagaram"))
        XCTAssertFalse(Solution().isAnagram("rat", "car"))
    }
}
