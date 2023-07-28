/**

 # Maximum Average Subarray I

 ## Description

 You are given an integer array `nums` consisting of `n` elements, and an
 integer `k`.

 Find a contiguous subarray whose **length is equal to** `k` that has the
 maximum average value and return _this value_. Any answer with a calculation
 error less than `10-5` will be accepted.

 **Example 1:**

     **Input:** nums = [1,12,-5,-6,50,3], k = 4
     **Output:** 12.75000
     **Explanation:** Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

 **Example 2:**

     **Input:** nums = [5], k = 1
     **Output:** 5.00000

 **Constraints:**

   * `n == nums.length`
   * `1 <= k <= n <= 105`
   * `-104 <= nums[i] <= 104`

 **Difficulty:** Easy

 **Link**: <https://leetcode-cn.com/problems/maximum-average-subarray-i>

 */

import XCTest

private class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum: Double = 0

        for i in 0 ..< k {
            sum += Double(nums[i])
        }

        var maxAverage: Double = sum / Double(k)
        for i in k ..< nums.count {
            sum += Double(nums[i])
            sum -= Double(nums[i - k])

            maxAverage = max(sum / Double(k), maxAverage)
        }

        return maxAverage
    }
}

class TestSolution0643: XCTestCase {
    func test1() {
        let nums1 = [1, 12, -5, -6, 50, 3]
        let res1 = Solution().findMaxAverage(nums1, 4)
        XCTAssertEqual(res1, 12.75)
    }

    func test2() {
        let nums1 = [5]
        let res1 = Solution().findMaxAverage(nums1, 1)
        XCTAssertEqual(res1, 5.0)
    }
}
