/**
 # Daily Temperatures

 ## Description

 Given an array of integers `temperatures` represents the daily temperatures,
 return _an array_ `answer` _such that_ `answer[i]` _is the number of days you
 have to wait after the_ `ith` _day to get a warmer temperature_. If there is
 no future day for which this is possible, keep `answer[i] == 0` instead.

 **Example 1:**

     **Input:** temperatures = [73,74,75,71,69,72,76,73]
     **Output:** [1,1,4,2,1,1,0,0]

 **Example 2:**

     **Input:** temperatures = [30,40,50,60]
     **Output:** [1,1,1,0]

 **Example 3:**

     **Input:** temperatures = [30,60,90]
     **Output:** [1,1,0]

 **Constraints:**

   * `1 <= temperatures.length <= 105`
   * `30 <= temperatures[i] <= 100`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/daily-temperatures>

 */

import XCTest

private class Solution {
    // 最小栈思想
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var minStack: [Int] = []
        var res: [Int] = Array(repeating: 0, count: temperatures.count)

        for (index, temperature) in temperatures.enumerated() {
            while !minStack.isEmpty, temperatures[minStack.last!] < temperature {
                let last = minStack.popLast()!
                res[last] = index - last
            }
            minStack.append(index)
        }

        return res
    }
}

class TestSolution0739: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]), [1, 1, 4, 2, 1, 1, 0, 0])
    }

    func test2() {
        XCTAssertEqual(Solution().dailyTemperatures([30, 40, 50, 60]), [1, 1, 1, 0])
    }

    func test3() {
        XCTAssertEqual(Solution().dailyTemperatures([30, 60, 90]), [1, 1, 0])
    }
}
