/**
 # Combination Sum II

 ## Description

 Given a collection of candidate numbers (`candidates`) and a target number
 (`target`), find all unique combinations in `candidates` where the candidate
 numbers sum to `target`.

 Each number in `candidates` may only be used **once** in the combination.

 **Note:**  The solution set must not contain duplicate combinations.

 **Example 1:**

     **Input:** candidates = [10,1,2,7,6,1,5], target = 8
     **Output:**
     [
     [1,1,6],
     [1,2,5],
     [1,7],
     [2,6]
     ]

 **Example 2:**

     **Input:** candidates = [2,5,2,1,2], target = 5
     **Output:**
     [
     [1,2,2],
     [5]
     ]

 **Constraints:**

   * `1 <= candidates.length <= 100`
   * `1 <= candidates[i] <= 50`
   * `1 <= target <= 30`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/combination-sum-ii>

 */

import XCTest

private class Solution {
    private var res: [[Int]] = []
    private var track: [Int] = []
    private var target: Int = 0

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        self.target = target
        let candidates = candidates.sorted(by: <)

        backtrack(candidates: candidates, start: 0, sum: 0)

        return res
    }

    private func backtrack(candidates: [Int], start: Int, sum: Int) {
        if sum == target {
            res.append(track)
            return
        }

        var used: Set<Int> = []

        for index in start ..< candidates.count {
            let candidate = candidates[index]
            let _sum = sum + candidate

            if _sum > target {
                break
            }
            if used.contains(candidate) {
                continue
            }
            used.insert(candidate)
            track.append(candidate)
            backtrack(candidates: candidates, start: index + 1, sum: _sum)
            _ = track.popLast()
        }
    }
}

class TestSolution0040: XCTestCase {
    func test1() {
        print(Solution().combinationSum2([10, 1, 2, 7, 6, 1, 5], 8))
    }

    func test2() {
        print(Solution().combinationSum2([2, 5, 2, 1, 2], 5))
    }
}
