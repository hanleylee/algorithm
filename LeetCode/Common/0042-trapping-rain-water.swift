/**
 # Trapping Rain Water

 ## Description

 Given `n` non-negative integers representing an elevation map where the width
 of each bar is `1`, compute how much water it can trap after raining.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png)

     **Input:** height = [0,1,0,2,1,0,1,3,2,1,2,1]
     **Output:** 6
     **Explanation:** The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

 **Example 2:**

     **Input:** height = [4,2,0,3,2,5]
     **Output:** 9

 **Constraints:**

   * `n == height.length`
   * `1 <= n <= 2 * 104`
   * `0 <= height[i] <= 105`

 **Difficulty:** Hard\n
 **Link**: <https://leetcode-cn.com/problems/trapping-rain-water>

 */

import XCTest

private class Solution {
    func trap(_ height: [Int]) -> Int {
        var left2RigthMax = Array(repeating: 0, count: height.count)
        var right2LeftMax = Array(repeating: 0, count: height.count)

        var prevHeight: Int = .min
        for idx in 0 ..< height.count {
            let maxHeight = max(height[idx], prevHeight)
            prevHeight = maxHeight
            left2RigthMax[idx] = maxHeight
        }

        prevHeight = .min

        for idx in (0 ..< height.count).reversed() {
            let maxHeight = max(height[idx], prevHeight)
            prevHeight = maxHeight
            right2LeftMax[idx] = maxHeight
        }

        var res = 0

        for (idx, h) in height.enumerated() {
            if idx - 1 < 0 || idx + 1 > height.count - 1 {
                continue
            }

            let leftMax = left2RigthMax[idx - 1]
            let rightMax = right2LeftMax[idx + 1]
            let remain = min(leftMax, rightMax) - h
            if remain > 0 {
                res += remain
            }
        }

        return res
    }
}

class TestSolution0042: XCTestCase {
    func test1() {
        print(Solution().trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
    }
}
