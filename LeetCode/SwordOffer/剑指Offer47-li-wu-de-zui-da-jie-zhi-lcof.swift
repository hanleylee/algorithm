/**
 # 礼物的最大价值 LCOF

 ## Description

 English description is not available for the problem. Please switch to
 Chinese.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof>

 */

import XCTest

private class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        var dpTable = grid
        var maxValue = 0

        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count {
                let leftValue = j - 1 < 0 ? 0 : dpTable[i][j - 1]
                let topValue = i - 1 < 0 ? 0 : dpTable[i - 1][j]
                dpTable[i][j] = max(leftValue, topValue) + grid[i][j]

                maxValue = max(dpTable[i][j], maxValue)
            }
        }

        return maxValue
    }
}

class TestSolution剑指Offer47: XCTestCase {
    func test1() {
        let res = Solution().maxValue([[1, 3, 1], [1, 5, 1], [4, 2, 1]])
        XCTAssertEqual(res, 12)
    }
}
