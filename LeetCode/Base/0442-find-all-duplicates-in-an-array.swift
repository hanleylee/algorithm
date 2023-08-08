/**
# Find All Duplicates in an Array

## Description

Given an integer array `nums` of length `n` where all the integers of `nums`
are in the range `[1, n]` and each integer appears **once** or **twice** ,
return _an array of all the integers that appears **twice**_.

You must write an algorithm that runs in `O(n) `time and uses only constant
extra space.



**Example 1:**

    
    
    **Input:** nums = [4,3,2,7,8,2,3,1]
    **Output:** [2,3]
    

**Example 2:**

    
    
    **Input:** nums = [1,1,2]
    **Output:** [1]
    

**Example 3:**

    
    
    **Input:** nums = [1]
    **Output:** []
    



**Constraints:**

  * `n == nums.length`
  * `1 <= n <= 105`
  * `1 <= nums[i] <= n`
  * Each element in `nums` appears **once** or **twice**.



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/find-all-duplicates-in-an-array>

*/

import XCTest

private class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var res: [Int] = []
        var nums = nums
        for num in nums {
            if nums[num - 1] > 0 {
                nums[num - 1] = -nums[num - 1]
            } else {
                res.append(num)
            }
        }

        return res
    }
}

class TestSolution0442: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().findDuplicates([4, 3, 2, 7, 8, 2, 3, 1]), [2, 3])
    }
}
