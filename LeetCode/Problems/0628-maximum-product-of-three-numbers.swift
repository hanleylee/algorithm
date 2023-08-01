/*
 * Given an integer array `nums`, *find three numbers whose product is maximum and
 * return the maximum product*.
 *
 *
 * Example 1:
 *
 * Input: nums = [1,2,3]
 * Output: 6
 *
 * Example 2:
 *
 * Input: nums = [1,2,3,4]
 * Output: 24
 *
 * Example 3:
 *
 * Input: nums = [-1,-2,-3]
 * Output: -6
 *
 *
 * Constraints:
 *
 * * `3 <= nums.length <= 104`
 * * `-1000 <= nums[i] <= 1000`
 *
 */

import XCTest

private class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        let length = sortedNums.count
        let positiveMaxValue = sortedNums[length-1] * sortedNums[length-2] * sortedNums[length-3]
        let negativeMaxValue = sortedNums[length-1] * sortedNums[length-2] * sortedNums[length-3]
        let mixMaxValue = sortedNums[0] * sortedNums[1] * sortedNums[length-1]
        let res = max(positiveMaxValue, negativeMaxValue, mixMaxValue)

        return res
    }

    func maximumProduct2(_ nums: [Int]) -> Int {
        /// 第一小的
        var min1: Int = .max
        var min2: Int = .max

        /// 第一大的
        var max1: Int = .min
        var max2: Int = .min
        var max3: Int = .min

        for num in nums {
            if num < min1 {
                min2 = min1
                min1 = num
            } else if num < min2 {
                min2 = num
            }

            if num > max1 {
                max3 = max2
                max2 = max1
                max1 = num
            } else if num > max2 {
                max3 = max2
                max2 = num
            } else if num > max3 {
                max3 = num
            }
        }

        let positiveMaxValue = max1 * max2 * max3
        let negativeMaxValue = max1 * max2 * max3
        let mixMaxValue = min1 * min2 * max1
        let res = max(positiveMaxValue, negativeMaxValue, mixMaxValue)

        return res
    }
}

class TestSolution0628: XCTestCase {
    func test1() {
        let sol = Solution()
        let nums1 = [1, 2, 3]
        let res1 = sol.maximumProduct(nums1)
        XCTAssertEqual(res1, 6)

        let nums2 = [1, 2, 3, 4]
        let res2 = sol.maximumProduct(nums2)
        XCTAssertEqual(res2, 24)

        let nums3 = [-1, -2, -3]
        let res3 = sol.maximumProduct(nums3)
        XCTAssertEqual(res3, -6)
    }

    func test2() {
        let sol = Solution()
        let nums1 = [1, 2, 3]
        let res1 = sol.maximumProduct2(nums1)
        XCTAssertEqual(res1, 6)

        let nums2 = [1, 2, 3, 4]
        let res2 = sol.maximumProduct2(nums2)
        XCTAssertEqual(res2, 24)

        let nums3 = [-1, -2, -3]
        let res3 = sol.maximumProduct2(nums3)
        XCTAssertEqual(res3, -6)
    }
}
