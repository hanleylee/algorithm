/**
 # Subsets

 ## Description

 Given an integer array `nums` of **unique** elements, return _all possible
 subsets (the power set)_.

 The solution set **must not** contain duplicate subsets. Return the solution
 in **any order**.

 **Example 1:**

     **Input:** nums = [1,2,3]
     **Output:** [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

 **Example 2:**

     **Input:** nums = [0]
     **Output:** [[],[0]]

 **Constraints:**

   * `1 <= nums.length <= 10`
   * `-10 <= nums[i] <= 10`
   * All the numbers of `nums` are **unique**.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/subsets>

 */

import XCTest

private class Solution {
    private var res: [[Int]] = []
    private var track: [Int] = []

    func subsets(_ nums: [Int]) -> [[Int]] {
        backtrack(nums: nums, start: 0)

        return res
    }

    private func backtrack(nums: [Int], start: Int) {
        res.append(track)

        for idx in start ..< nums.count {
            let current = nums[idx]
            track.append(current)
            backtrack(nums: nums, start: idx + 1)
            _ = track.popLast()
        }
    }
}

class TestSolution0078: XCTestCase {
    func test1() {
        print(Solution().subsets([1, 2, 3]))
    }

    func test2() {
        print(Solution().subsets([0]))
    }
}
