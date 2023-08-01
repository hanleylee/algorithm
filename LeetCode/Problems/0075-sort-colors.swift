/*
 * Given an array `nums` with `n` objects colored red, white, or blue, sort them
 * [in-place][1] so that objects of the same color are adjacent, with the
 * colors in the order red, white, and blue.
 *
 * We will use the integers `0`, `1`, and `2` to represent the color red, white,
 * and blue, respectively.
 *
 * You must solve this problem without using the library's sort function.
 *
 *
 * Example 1:
 *
 * Input: nums = [2,0,2,1,1,0]
 * Output: [0,0,1,1,2,2]
 *
 * Example 2:
 *
 * Input: nums = [2,0,1]
 * Output: [0,1,2]
 *
 *
 * Constraints:
 *
 * * `n == nums.length`
 * * `1 <= n <= 300`
 * * `nums[i]` is either `0`, `1`, or `2`.
 *
 *
 * Follow up: Could you come up with a one-pass algorithm using only constant
 * extra space?
 *
 * [1] https://en.wikipedia.org/wiki/In-place_algorithm
 *
 */

import XCTest

private class Solution {
    // 单指针法
    func sortColors(_ nums: inout [Int]) {
        var slow = 0

        for i in 0 ..< nums.count {
            if nums[i] == 0 {
                nums.swapAt(i, slow)
                slow += 1
            }
        }

        for i in slow ..< nums.count {
            if nums[i] == 1 {
                nums.swapAt(i, slow)
                slow += 1
            }
        }
    }

    // 刷油漆法
    func sortColors2(_ nums: inout [Int]) {
        var index0 = 0
        var index1 = 0

        for i in 0 ..< nums.count {
            let num = nums[i]
            nums[i] = 2
            if num < 2 {
                nums[index1] = 1
                index1 += 1
            }

            if num < 1 {
                nums[index0] = 0
                index0 += 1
            }
        }
    }
}

class TestSolution0075: XCTestCase {
    func test1() {
        var nums1 = [1, 0, 2, 1, 0]
        Solution().sortColors(&nums1)
        XCTAssertEqual(nums1, [0, 0, 1, 1, 2])

        var nums0 = [0]
        Solution().sortColors(&nums0)
        XCTAssertEqual(nums0, [0])
    }

    func test2() {
        var nums1 = [1, 0, 2, 1, 0]
        Solution().sortColors2(&nums1)
        XCTAssertEqual(nums1, [0, 0, 1, 1, 2])

        var nums0 = [0]
        Solution().sortColors2(&nums0)
        XCTAssertEqual(nums0, [0])
    }
}
