/**
# Search in Rotated Sorted Array

## Description

There is an integer array `nums` sorted in ascending order (with **distinct**
values).

Prior to being passed to your function, `nums` is **possibly rotated** at an
unknown pivot index `k` (`1 <= k < nums.length`) such that the resulting array
is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` (
**0-indexed** ). For example, `[0,1,2,4,5,6,7]` might be rotated at pivot
index `3` and become `[4,5,6,7,0,1,2]`.

Given the array `nums` **after** the possible rotation and an integer
`target`, return _the index of_`target` _if it is in_`nums` _, or_`-1` _if it
is not in_`nums`.

You must write an algorithm with `O(log n)` runtime complexity.



**Example 1:**

    
    
    **Input:** nums = [4,5,6,7,0,1,2], target = 0
    **Output:** 4
    

**Example 2:**

    
    
    **Input:** nums = [4,5,6,7,0,1,2], target = 3
    **Output:** -1
    

**Example 3:**

    
    
    **Input:** nums = [1], target = 0
    **Output:** -1
    



**Constraints:**

  * `1 <= nums.length <= 5000`
  * `-104 <= nums[i] <= 104`
  * All values of `nums` are **unique**.
  * `nums` is an ascending array that is possibly rotated.
  * `-104 <= target <= 104`



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/search-in-rotated-sorted-array>

*/

import XCTest

// TODO: submit error
private class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let maxIndex = findIndexOfMaxValue(nums)

        var left = 0
        var right = nums.count - 1

        while (left <= right) {
            let rawMid = left + (right - left) / 2
            let offsetedMid = (rawMid + maxIndex) % (nums.count)
            let midValue = nums[offsetedMid]
            if midValue == target {
                return offsetedMid
            } else if midValue > target {
                right = rawMid - 1
            } else if midValue < target {
                left = rawMid + 1
            }
        }

        return -1
    }

    func findIndexOfMaxValue(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while (left < right) {
            let mid = left + (right - left + 1) / 2
            if (nums[mid] > nums[left]) {
                left = mid
            } else if nums[mid] == nums[left] {
                left = mid
            } else if (nums[mid] < nums[left]) {
                right = mid - 1
            }
        }

        return left
    }
}

class TestSolution0033: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().search([4, 5, 6, 7, 0, 1, 2], 0), 4)
    }

    func test2() {
        XCTAssertEqual(Solution().search([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }

    func test3() {
        XCTAssertEqual(Solution().search([1, 3], 1), 0)
    }

    func test4() {
        XCTAssertEqual(Solution().search([1, 3], 3), 1)
    }

    func test5() {
        XCTAssertEqual(Solution().search([3, 1], 1), 1)
    }
}
