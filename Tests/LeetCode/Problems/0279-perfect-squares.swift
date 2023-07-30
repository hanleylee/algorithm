/**
 # Perfect Squares

 ## Description

 Given an integer `n`, return _the least number of perfect square numbers that
 sum to_ `n`.

 A **perfect square** is an integer that is the square of an integer; in other
 words, it is the product of some integer with itself. For example, `1`, `4`,
 `9`, and `16` are perfect squares while `3` and `11` are not.

 **Example 1:**

     **Input:** n = 12
     **Output:** 3
     **Explanation:** 12 = 4 + 4 + 4.

 **Example 2:**

     **Input:** n = 13
     **Output:** 2
     **Explanation:** 13 = 4 + 9.

 **Constraints:**

   * `1 <= n <= 104`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/perfect-squares>

 */

import XCTest

private class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: n + 1)

        for i in 1 ... n {
            var j = 1
            var minValue = Int.max

            while j * j <= i {
                minValue = min(minValue, dp[i - j * j] + 1)
                j += 1
            }

            dp[i] = minValue
        }

        return dp[n]
    }
}

class TestSolution0279: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().numSquares(12), 3) // 12 = 4 + 4 + 4
    }

    func test2() {
        XCTAssertEqual(Solution().numSquares(13), 2) // 12 = 4 + 9
    }
}
