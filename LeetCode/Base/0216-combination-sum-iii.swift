/**
# Combination Sum III

## Description

Find all valid combinations of `k` numbers that sum up to `n` such that the
following conditions are true:

  * Only numbers `1` through `9` are used.
  * Each number is used **at most once**.

Return _a list of all possible valid combinations_. The list must not contain
the same combination twice, and the combinations may be returned in any order.



**Example 1:**

    
    
    **Input:** k = 3, n = 7
    **Output:** [[1,2,4]]
    **Explanation:**
    1 + 2 + 4 = 7
    There are no other valid combinations.

**Example 2:**

    
    
    **Input:** k = 3, n = 9
    **Output:** [[1,2,6],[1,3,5],[2,3,4]]
    **Explanation:**
    1 + 2 + 6 = 9
    1 + 3 + 5 = 9
    2 + 3 + 4 = 9
    There are no other valid combinations.
    

**Example 3:**

    
    
    **Input:** k = 4, n = 1
    **Output:** []
    **Explanation:** There are no valid combinations.
    Using 4 different numbers in the range [1,9], the smallest sum we can get is 1+2+3+4 = 10 and since 10 > 1, there are no valid combination.
    



**Constraints:**

  * `2 <= k <= 9`
  * `1 <= n <= 60`



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/combination-sum-iii>

*/

import XCTest

private class Solution {
    private var res: [[Int]] = []
    private var track: [Int] = []
    private var maxCount: Int = 0
    private var target: Int = 0

    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        maxCount = k
        target = n
        backtrack(nums: Array(1...9), start: 0, sum: 0)

        return res
    }

    private func backtrack(nums: [Int], start: Int, sum: Int) {
        if track.count >= maxCount {
            if sum == target {
                res.append(track)
            }

            return
        }

        for i in start ..< nums.count {
            let sum = sum + nums[i]
            if sum > target {
                break
            }
            track.append(nums[i])
            backtrack(nums: nums, start: i + 1, sum: sum)
            _ = track.popLast()
        }

    }
}

class TestSolution0216: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().combinationSum3(3, 7), [[1,2,4]])
    }

    func test2() {
        XCTAssertEqual(Solution().combinationSum3(3, 9), [[1, 2, 6], [1, 3, 5], [2, 3, 4]])
    }
}
