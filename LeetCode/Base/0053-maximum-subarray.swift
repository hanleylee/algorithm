/**
 # Maximum Subarray

 ## Description

 Given an integer array `nums`, find the contiguous subarray (containing at
 least one number) which has the largest sum and return _its sum_.

 A **subarray** is a **contiguous** part of an array.

 **Example 1:**

     **Input:** nums = [-2,1,-3,4,-1,2,1,-5,4]
     **Output:** 6
     **Explanation:** [4,-1,2,1] has the largest sum = 6.

 **Example 2:**

     **Input:** nums = [1]
     **Output:** 1

 **Example 3:**

     **Input:** nums = [5,4,-1,7,8]
     **Output:** 23

 **Constraints:**

   * `1 <= nums.length <= 105`
   * `-104 <= nums[i] <= 104`

 **Follow up:** If you have figured out the `O(n)` solution, try coding another
 solution using the **divide and conquer** approach, which is more subtle.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/maximum-subarray>

 */

import XCTest

private class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxVal = Int.min
        var preSum = 0

        for num in nums {
            let curSum = preSum + num
            maxVal = curSum > num ? max(curSum, maxVal) : max(num, maxVal)
            preSum = max(curSum, num)
        }
        return maxVal
    }
}

class TestSolution0053: XCTestCase {
    func test1() {
        let res = Solution().maxSubArray([-1, 1, -3, 4, -1, 2, 1, -5, 4])
        XCTAssertEqual(res, 6)
    }

    func test2() {
        let res = Solution().maxSubArray([-1, -2])
        XCTAssertEqual(res, -1)
    }
}
