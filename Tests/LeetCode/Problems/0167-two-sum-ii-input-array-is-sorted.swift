/*
 * Given a 1-indexed array of integers `numbers` that is already *sorted in
 * non-decreasing order*, find two numbers such that they add up to a specific
 * `target` number. Let these two numbers be `numbers[index1]` and
 * `numbers[index2]` where `1 <= index1 < index2 < numbers.length`.
 *
 * Return* the indices of the two numbers, *`index1`* and *`index2`*, added by
 * one as an integer array *`[index1, index2]`* of length 2.*
 *
 * The tests are generated such that there is exactly one solution. You may
 * not use the same element twice.
 *
 * Your solution must use only constant extra space.
 *
 *
 * Example 1:
 *
 * Input: numbers = [2,7,11,15], target = 9
 * Output: [1,2]
 * Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We
 * return [1, 2].
 *
 * Example 2:
 *
 * Input: numbers = [2,3,4], target = 6
 * Output: [1,3]
 * Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We r
 * eturn [1, 3].
 *
 * Example 3:
 *
 * Input: numbers = [-1,0], target = -1
 * Output: [1,2]
 * Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We
 *  return [1, 2].
 *
 *
 * Constraints:
 *
 * * `2 <= numbers.length <= 3 * 104`
 * * `-1000 <= numbers[i] <= 1000`
 * * `numbers` is sorted in non-decreasing order.
 * * `-1000 <= target <= 1000`
 * * The tests are generated such that there is exactly one solution.
 *
 */

import XCTest

private class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        func binarySearch(nums: [Int], target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    return mid
                } else if nums[mid] > target {
                    right = mid - 1
                } else if nums[mid] < target {
                    left = mid + 1
                }
            }

            return -1
        }
        for index in 0 ..< numbers.count {
            let partNums = Array(numbers[index + 1 ... numbers.count - 1])
            let targetIndex = binarySearch(nums: partNums, target: target - numbers[index])

            if targetIndex != -1 {
                return [index + 1, index + targetIndex + 2]
            }
        }

        return []
    }

    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1

        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            }
        }

        return []
    }
}

class TestSolution0167: XCTestCase {
    func test1() {
        let sol = Solution()
        let nums1 = [2, 7, 11, 15]
        let res1 = sol.twoSum(nums1, 9)
        XCTAssertEqual(res1, [1, 2])

        let nums2 = [2, 3, 4]
        let res2 = sol.twoSum(nums2, 6)
        XCTAssertEqual(res2, [1, 3])

        let nums3 = [-1, 0]
        let res3 = sol.twoSum(nums3, -1)
        XCTAssertEqual(res3, [1, 2])
    }

    func test2() {
        let sol = Solution()
        let nums1 = [2, 7, 11, 15]
        let res1 = sol.twoSum2(nums1, 9)
        XCTAssertEqual(res1, [1, 2])

        let nums2 = [2, 3, 4]
        let res2 = sol.twoSum2(nums2, 6)
        XCTAssertEqual(res2, [1, 3])

        let nums3 = [-1, 0]
        let res3 = sol.twoSum2(nums3, -1)
        XCTAssertEqual(res3, [1, 2])
    }
}
