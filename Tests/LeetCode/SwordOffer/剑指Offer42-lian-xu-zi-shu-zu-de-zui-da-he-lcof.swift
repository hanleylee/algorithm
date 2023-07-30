/**
 # 连续子数组的最大和  LCOF

 ## Description

 English description is not available for the problem. Please switch to
 Chinese.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof>

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

class TestSolution剑指Offer42: XCTestCase {
    func test1() {
        let res = Solution().maxSubArray([-1, 1, -3, 4, -1, 2, 1, -5, 4])
        XCTAssertEqual(res, 6)
    }

    func test2() {
        let res = Solution().maxSubArray([-1, -2])
        XCTAssertEqual(res, -1)
    }
}
