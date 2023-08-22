/**
 # House Robber

 ## Description

 You are a professional robber planning to rob houses along a street. Each
 house has a certain amount of money stashed, the only constraint stopping you
 from robbing each of them is that adjacent houses have security systems
 connected and **it will automatically contact the police if two adjacent
 houses were broken into on the same night**.

 Given an integer array `nums` representing the amount of money of each house,
 return _the maximum amount of money you can rob tonight **without alerting the
 police**_.

 **Example 1:**

     **Input:** nums = [1,2,3,1]
     **Output:** 4
     **Explanation:** Rob house 1 (money = 1) and then rob house 3 (money = 3).
     Total amount you can rob = 1 + 3 = 4.

 **Example 2:**

     **Input:** nums = [2,7,9,3,1]
     **Output:** 12
     **Explanation:** Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
     Total amount you can rob = 2 + 9 + 1 = 12.

 **Constraints:**

   * `1 <= nums.length <= 100`
   * `0 <= nums[i] <= 400`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/house-robber>

 */

import XCTest

private class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }

        var dp: [Int] = Array(repeating: 0, count: nums.count)

        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2 ..< nums.count {
            let selectRes = dp[i - 2] + nums[i]
            let nonSelectRes = dp[i - 1]
            dp[i] = max(selectRes, nonSelectRes)
        }

        return dp[nums.count - 1]
    }

    // 压缩状态
    func rob2(_ nums: [Int]) -> Int {
        var preSelectRes: Int = 0
        var prePreSelectRes: Int = 0

        for i in 0 ..< nums.count {
            let curSelectRes = max(preSelectRes, prePreSelectRes + nums[i])

            prePreSelectRes = preSelectRes
            preSelectRes = curSelectRes
        }

        return preSelectRes
    }
}

class TestSolution0198: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().rob([1, 2, 3, 1]), 4)
    }

    func test2() {
        XCTAssertEqual(Solution().rob([2, 7, 9, 3, 1]), 12)
    }

    func test3() {
        XCTAssertEqual(Solution().rob2([1, 2, 3, 1]), 4)
    }

    func test4() {
        XCTAssertEqual(Solution().rob2([2, 7, 9, 3, 1]), 12)
    }
}
