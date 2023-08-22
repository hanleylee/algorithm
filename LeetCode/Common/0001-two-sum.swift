/*
 * Given an array of integers `nums` and an integer `target`, return *indices of
 * the two numbers such that they add up to `target`*.
 *
 * You may assume that each input would have *exactly* one solution, and you
 * may not use the *same* element twice.
 *
 * You can return the answer in any order.
 *
 *
 * Example 1:
 *
 * Input: nums = [2,7,11,15], target = 9
 * Output: [0,1]
 * Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 *
 * Example 2:
 *
 * Input: nums = [3,2,4], target = 6
 * Output: [1,2]
 *
 * Example 3:
 *
 * Input: nums = [3,3], target = 6
 * Output: [0,1]
 *
 *
 * Constraints:
 *
 * * `2 <= nums.length <= 104`
 * * `-109 <= nums[i] <= 109`
 * * `-109 <= target <= 109`
 * * Only one valid answer exists.
 *
 *
 * Follow-up: Can you come up with an algorithm that is less than `O(n2) `time
 * complexity?
 *
 */

import XCTest

private class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< nums.count - 1 {
            for j in (i + 1) ..< nums.count {
                let res = nums[i] + nums[j]
                if res == target {
                    return [i, j]
                }
            }
        }
        return []
    }

    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int: Int] = [:]

        for i in 0 ..< nums.count {
            let diff = target - nums[i]

            if let j = dic[diff] {
                return [i, j]
            } else {
                dic[nums[i]] = i
            }
        }

        return []
    }
}

class TestSolution0001: XCTestCase {

    func test1() {

        let sol = Solution()
        XCTAssertEqual(sol.twoSum([2, 7, 11, 15], 9), [0, 1])
        XCTAssertEqual(sol.twoSum([3, 2, 4], 6), [1, 2])
        XCTAssertEqual(sol.twoSum([3, 3], 6), [0, 1])
    }

    func test2() {
        let sol = Solution()
        XCTAssertEqual(sol.twoSum2([2, 7, 11, 15], 9).sorted(), [0, 1])
        XCTAssertEqual(sol.twoSum2([3, 2, 4], 6).sorted(), [1, 2])
        XCTAssertEqual(sol.twoSum2([3, 3], 6).sorted(), [0, 1])
    }
}
