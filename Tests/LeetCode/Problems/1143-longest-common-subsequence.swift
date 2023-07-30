/**
 # Longest Common Subsequence

 ## Description

 Given two strings `text1` and `text2`, return _the length of their longest
 **common subsequence**. _If there is no **common subsequence** , return `0`.

 A **subsequence** of a string is a new string generated from the original
 string with some characters (can be none) deleted without changing the
 relative order of the remaining characters.

   * For example, `"ace"` is a subsequence of `"abcde"`.

 A **common subsequence** of two strings is a subsequence that is common to
 both strings.

 **Example 1:**

     **Input:** text1 = "abcde", text2 = "ace"
     **Output:** 3
     **Explanation:** The longest common subsequence is "ace" and its length is 3.

 **Example 2:**

     **Input:** text1 = "abc", text2 = "abc"
     **Output:** 3
     **Explanation:** The longest common subsequence is "abc" and its length is 3.

 **Example 3:**

     **Input:** text1 = "abc", text2 = "def"
     **Output:** 0
     **Explanation:** There is no such common subsequence, so the result is 0.

 **Constraints:**

   * `1 <= text1.length, text2.length <= 1000`
   * `text1` and `text2` consist of only lowercase English characters.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/longest-common-subsequence>

 */

import XCTest

private class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        let len1 = text1.count
        let len2 = text2.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: len2 + 1), count: len1 + 1)

        for i in 1 ... len1 {
            for j in 1 ... len2 {
                if text1[i - 1] == text2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }

        return dp[len1][len2]
    }
}

class TestSolution1143: XCTestCase {
    func test1() {
        let res = Solution().longestCommonSubsequence("abcde", "ace")
        XCTAssertEqual(res, 3)
    }

    func test2() {
        let res = Solution().longestCommonSubsequence("abc", "abc")
        XCTAssertEqual(res, 3)
    }

    func test3() {
        let res = Solution().longestCommonSubsequence("abc", "def")
        XCTAssertEqual(res, 0)
    }

    func test4() {
        let res = Solution().longestCommonSubsequence("bsbininm", "jmjkbkjkv")
        XCTAssertEqual(res, 1)
    }
}
