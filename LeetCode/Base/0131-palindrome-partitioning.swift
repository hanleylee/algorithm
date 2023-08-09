/**
 # Palindrome Partitioning

 ## Description

 Given a string `s`, partition `s` such that every substring of the partition
 is a **palindrome**. Return all possible palindrome partitioning of `s`.

 A **palindrome** string is a string that reads the same backward as forward.

 **Example 1:**

     **Input:** s = "aab"
     **Output:** [["a","a","b"],["aa","b"]]

 **Example 2:**

     **Input:** s = "a"
     **Output:** [["a"]]

 **Constraints:**

   * `1 <= s.length <= 16`
   * `s` contains only lowercase English letters.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/palindrome-partitioning>

 */

import XCTest

private class Solution {
    private var res: [[String]] = []
//    private var track: [[Character]] = []

    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        dfs(str: s, track: [], start: 0)

        return res
    }

    func dfs(str: [Character], track: [[Character]], start: Int) {
        if start == str.count {
            res.append(track.map { String($0) })
            return
        }

        for index in start ..< str.count {
            if isPalindrome(str: str, start: start, end: index) {
                var track = track
                let currentStr = Array(str[start ... index])
                track.append(currentStr)
                dfs(str: str, track: track, start: index + 1)
            }
        }
    }

    private func isPalindrome(str: [Character], start: Int, end: Int) -> Bool {
        var start = start
        var end = end
        while start < end {
            if str[start] != str[end] {
                return false
            }
            start += 1
            end -= 1
        }

        return true
    }
}

class TestSolution0131: XCTestCase {
    func test1() {
        print(Solution().partition("aab"))
    }

    func test2() {
        print(Solution().partition("a"))
    }
}
