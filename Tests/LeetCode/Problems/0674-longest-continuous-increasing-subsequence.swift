/**

 # Longest Continuous Increasing Subsequence

 ## Description

 Given an unsorted array of integers `nums`, return _the length of the longest
 **continuous increasing subsequence** (i.e. subarray)_. The subsequence must
 be **strictly** increasing.

 A **continuous increasing subsequence** is defined by two indices `l` and `r`
 (`l < r`) such that it is `[nums[l], nums[l + 1], ..., nums[r - 1], nums[r]]`
 and for each `l <= i < r`, `nums[i] < nums[i + 1]`.

 **Example 1:**

     **Input:** nums = [1,3,5,4,7]
     **Output:** 3
     **Explanation:** The longest continuous increasing subsequence is [1,3,5] with length 3.
     Even though [1,3,5,7] is an increasing subsequence, it is not continuous as elements 5 and 7 are separated by element
     4.

 **Example 2:**

     **Input:** nums = [2,2,2,2,2]
     **Output:** 1
     **Explanation:** The longest continuous increasing subsequence is [2] with length 1. Note that it must be strictly
     increasing.

 **Constraints:**

   * `1 <= nums.length <= 104`
   * `-109 <= nums[i] <= 109`

 **Difficulty:** Easy

 **Link**: <https://leetcode-cn.com/problems/longest-continuous-increasing-subsequence>

 */

import XCTest

private class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var p1 = 0
        var maxIncrease = 1

        for i in 1 ..< nums.count {
            if nums[i] > nums[i - 1] {
                maxIncrease = max(maxIncrease, i - p1 + 1)
            } else {
                p1 = i
            }
        }

        return maxIncrease
    }
}

class TestSolution0674: XCTestCase {
    func test1() {
        let nums1 = [1, 3, 5, 4, 7]
        XCTAssertEqual(Solution().findLengthOfLCIS(nums1), 3)
    }
}
