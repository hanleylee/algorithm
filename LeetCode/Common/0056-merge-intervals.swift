/**
 # Merge Intervals

 ## Description

 Given an array of `intervals` where `intervals[i] = [starti, endi]`, merge all
 overlapping intervals, and return _an array of the non-overlapping intervals
 that cover all the intervals in the input_.

 **Example 1:**

     **Input:** intervals = [[1,3],[2,6],[8,10],[15,18]]
     **Output:** [[1,6],[8,10],[15,18]]
     **Explanation:** Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

 **Example 2:**

     **Input:** intervals = [[1,4],[4,5]]
     **Output:** [[1,5]]
     **Explanation:** Intervals [1,4] and [4,5] are considered overlapping.

 **Constraints:**

   * `1 <= intervals.length <= 104`
   * `intervals[i].length == 2`
   * `0 <= starti <= endi <= 104`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/merge-intervals>

 */

import XCTest

private class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res: [[Int]] = []
        let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })

        var prevLeft = sortedIntervals.first![0]
        var prevRight = sortedIntervals.first![1]

        for interval in sortedIntervals {
            let curLeft = interval[0]
            let curRight = interval[1]
            if curLeft <= prevRight {
                prevRight = max(prevRight, curRight)

            } else {
                res.append([prevLeft, prevRight])

                prevLeft = curLeft
                prevRight = curRight
            }
        }

        res.append([prevLeft, prevRight])

        return res
    }
}

class TestSolution0056: XCTestCase {
    func test1() {
        print(Solution().merge([[1, 3], [2, 6], [8, 10], [15, 18]]))
    }
}
