/**
 # 数组中重复的数字 LCOF

 ## Description

 English description is not available for the problem. Please switch to
 Chinese.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof>

 */

import XCTest

private class Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var nums = nums

        let zeros = nums.filter { $0 == 0 }
        if zeros.count > 1 {
            return 0
        }

        for num in nums {
            if nums[abs(num)] < 0 {
                return num
            } else if nums[num] == 0 {
                nums[num] = Int.min
            } else {
                nums[num] = -nums[num]
            }
        }

        return 0
    }
}

class TestSolution剑指Offer03: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().findRepeatNumber([2, 3, 1, 0, 2, 5, 3]), 2)
    }

    func test2() {
        XCTAssertEqual(Solution().findRepeatNumber([1, 0, 1, 4, 2, 5, 3]), 1)
    }

    func test3() {
        XCTAssertEqual(Solution().findRepeatNumber([3, 4, 2, 0, 0, 1]), 0)
    }
}
