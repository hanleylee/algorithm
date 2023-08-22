/**
 # Subsets II

 ## Description

 Given an integer array `nums` that may contain duplicates, return _all
 possible subsets (the power set)_.

 The solution set **must not** contain duplicate subsets. Return the solution
 in **any order**.

 **Example 1:**

     **Input:** nums = [1,2,2]
     **Output:** [[],[1],[1,2],[1,2,2],[2],[2,2]]

 **Example 2:**

     **Input:** nums = [0]
     **Output:** [[],[0]]

 **Constraints:**

   * `1 <= nums.length <= 10`
   * `-10 <= nums[i] <= 10`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/subsets-ii>

 */

import XCTest

private class Solution {
    private var res: [[Int]] = []
    private var track: [Int] = []

    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        backtrack(nums: nums, start: 0)
        return res
    }

    private func backtrack(nums: [Int], start: Int) {
        res.append(track)

        var visited: Set<Int> = []

        for idx in start ..< nums.count {
            if visited.contains(nums[idx]) {
                continue
            }
            track.append(nums[idx])
            visited.insert(nums[idx])
            backtrack(nums: nums, start: idx + 1)
            _ = track.popLast()
        }
    }
}

class TestSolution0090: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().subsetsWithDup([1, 2, 2]), [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]])
    }
}
