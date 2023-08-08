/**
 # Partition Equal Subset Sum

 ## Description

 Given a **non-empty** array `nums` containing **only positive integers** ,
 find if the array can be partitioned into two subsets such that the sum of
 elements in both subsets is equal.

 **Example 1:**

     **Input:** nums = [1,5,11,5]
     **Output:** true
     **Explanation:** The array can be partitioned as [1, 5, 5] and [11].

 **Example 2:**

     **Input:** nums = [1,2,3,5]
     **Output:** false
     **Explanation:** The array cannot be partitioned into equal sum subsets.

 **Constraints:**

   * `1 <= nums.length <= 200`
   * `1 <= nums[i] <= 100`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/partition-equal-subset-sum>

 */

import XCTest

private class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % 2 == 1 {
            return false
        }

        let target = sum / 2
        var numSet: Set<Int> = [0]

        // 是否有以 dp[i] 为和的集合
        var dp = Array(repeating: false, count: target + 1)

        for num in nums {
            for n in numSet {
                guard (n + num) < target + 1 else { continue }
                dp[n + num] = true
                numSet.insert(n + num)
            }
        }

        return dp[target]
    }
}

class TestSolution0416: XCTestCase {
    func test1() {
        print(Solution().canPartition([1, 5, 11, 5]))
        print(Solution().canPartition([1, 2, 3, 5]))
    }
}
