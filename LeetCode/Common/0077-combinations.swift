/**
# Combinations

## Description

Given two integers `n` and `k`, return _all possible combinations of_ `k`
_numbers out of the range_ `[1, n]`.

You may return the answer in **any order**.



**Example 1:**

    
    
    **Input:** n = 4, k = 2
    **Output:**
    [
      [2,4],
      [3,4],
      [2,3],
      [1,2],
      [1,3],
      [1,4],
    ]
    

**Example 2:**

    
    
    **Input:** n = 1, k = 1
    **Output:** [[1]]
    



**Constraints:**

  * `1 <= n <= 20`
  * `1 <= k <= n`



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/combinations>

*/

import XCTest

private class Solution {
    private var res: [[Int]] = []
    private var track: [Int] = []
    private var maxCount = 0

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        maxCount = k

        backtrack(nums: Array(1...n), start: 0)

        return res
    }

    private func backtrack(nums: [Int], start: Int) {
        if track.count == maxCount {
            res.append(track)
            return
        }

        for i in start ..< nums.count {
            track.append(nums[i])
            backtrack(nums: nums, start: i + 1)
            _ = track.popLast()
        }
    }
}

class TestSolution0077: XCTestCase {
    func test1() {
        print(Solution().combine(4, 2))

    }
}
