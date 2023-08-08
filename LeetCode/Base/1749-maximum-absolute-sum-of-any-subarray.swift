/**
 # Maximum Absolute Sum of Any Subarray

 ## Description

 You are given an integer array `nums`. The **absolute sum** of a subarray
 `[numsl, numsl+1, ..., numsr-1, numsr]` is `abs(numsl + numsl+1 + ... +
 numsr-1 + numsr)`.

 Return _the **maximum** absolute sum of any **(possibly empty)** subarray of
 _`nums`.

 Note that `abs(x)` is defined as follows:

   * If `x` is a negative integer, then `abs(x) = -x`.
   * If `x` is a non-negative integer, then `abs(x) = x`.

 **Example 1:**

     **Input:** nums = [1,-3,2,3,-4]
     **Output:** 5
     **Explanation:** The subarray [2,3] has absolute sum = abs(2+3) = abs(5) = 5.

 **Example 2:**

     **Input:** nums = [2,-5,1,-4,3,-2]
     **Output:** 8
     **Explanation:** The subarray [-5,1,-4] has absolute sum = abs(-5+1-4) = abs(-8) = 8.

 **Constraints:**

   * `1 <= nums.length <= 105`
   * `-104 <= nums[i] <= 104`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/maximum-absolute-sum-of-any-subarray>

 */

import XCTest

private class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: Int.min, count: nums.count)

        /// 之前的合(可能为正或负)
        var preSumRaw: Int = 0

        for (index, num) in nums.enumerated() {
            let preSumABS = index > 0 ? dp[index - 1] : 0
            let currentSum: Int
            if (preSumRaw < 0 && num < 0) || (preSumRaw > 0 && num > 0) {
                currentSum = preSumABS + abs(num)
            } else {
                currentSum = abs(preSumABS - abs(num))
            }

            let currentMax: Int
            if abs(num) >= currentSum {
                preSumRaw = num
                currentMax = abs(num)
            } else {
                preSumRaw += num
                currentMax = currentSum
            }
            dp[index] = currentMax
        }

        return dp.max()!
    }
}

class TestSolution1749: XCTestCase {
    func test1() {
        print(Solution().maxAbsoluteSum([1, -3, 2, 3, -4]))
    }

    func test2() {
        print(Solution().maxAbsoluteSum([2,-5,1,-4,3,-2]))
    }

    func test3() {
        print(Solution().maxAbsoluteSum([-7,-1,0,-2,1,3,8,-2,-6,-1,-10,-6,-6,8,-4,-9,-4,1,4,-9]))
    }
}
