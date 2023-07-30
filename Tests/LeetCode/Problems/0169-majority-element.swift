/**
# Majority Element

## Description

Given an array `nums` of size `n`, return _the majority element_.

The majority element is the element that appears more than `⌊n / 2⌋` times.
You may assume that the majority element always exists in the array.



**Example 1:**

    
    
    **Input:** nums = [3,2,3]
    **Output:** 3
    

**Example 2:**

    
    
    **Input:** nums = [2,2,1,1,1,2,2]
    **Output:** 2
    



**Constraints:**

  * `n == nums.length`
  * `1 <= n <= 5 * 104`
  * `-231 <= nums[i] <= 231 - 1`



**Follow-up:** Could you solve the problem in linear time and in `O(1)` space?



**Difficulty:** Easy\n
**Link**: <https://leetcode-cn.com/problems/majority-element>

*/

import XCTest

private class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var leader: Int = 0
        var count = 0

        for num in nums {
            if num == leader {
                count += 1
            } else {
                count -= 1

                if count < 0 {
                    leader = num
                    count = 0
                }
            }
        }

        return leader
    }
}

class TestSolution0169: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().majorityElement([2, 2, 1, 1, 1, 2, 2]), 2)
    }

    func test2() {
        XCTAssertEqual(Solution().majorityElement([3, 2, 3]), 3)
    }
}
