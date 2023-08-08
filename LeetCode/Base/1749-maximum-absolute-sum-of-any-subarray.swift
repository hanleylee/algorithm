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
        // 分别求出子数组和的最大值与子数组和的最小值
        var negativeMin = 0
        var negativeSum = 0

        var positiveMax = 0
        var positiveSum = 0

        for num in nums {
            negativeSum += num
            negativeMin = min(negativeMin, negativeSum)
            negativeSum = min(0, negativeSum)

            positiveSum += num
            positiveMax = max(positiveMax, positiveSum)
            positiveSum = max(0, positiveSum)
        }

        return max(positiveMax, -negativeMin)
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
