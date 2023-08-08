/**

 # Advantage Shuffle

 ## Description

 You are given two integer arrays `nums1` and `nums2` both of the same length.
 The **advantage** of `nums1` with respect to `nums2` is the number of indices
 `i` for which `nums1[i] > nums2[i]`.

 Return _any permutation of_`nums1` _that maximizes its **advantage** with
 respect to _`nums2`.

 **Example 1:**

     **Input:** nums1 = [2,7,11,15], nums2 = [1,10,4,11]
     **Output:** [2,11,7,15]

 **Example 2:**

     **Input:** nums1 = [12,24,8,32], nums2 = [13,25,32,11]
     **Output:** [24,32,8,12]

 **Constraints:**

   * `1 <= nums1.length <= 105`
   * `nums2.length == nums1.length`
   * `0 <= nums1[i], nums2[i] <= 109`

 **Difficulty:** Medium

 **Link**: <https://leetcode-cn.com/problems/advantage-shuffle>

 */

import XCTest

private class Solution {
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var n1 = nums1.sorted(by: <)
        let n2 = nums2.sorted(by: <)

        var indexDic: [Int: Int] = [:]
        for i in 0 ..< nums2.count {
            indexDic[nums2[i]] = i
        }

        var remains: [Int] = []
        var res: [Int] = Array(repeating: 0, count: nums1.count)

        var p = 0

        for num in n2 {
            guard let index = indexDic[num] else { return [] }
            while p < nums1.count, n1[p] <= num {
                remains.append(n1[p])
                p += 1
            }

            if p >= nums1.count {
                guard let element = remains.popLast() else { return [] }
                res[index] = element
            } else {
                res[index] = n1[p]
            }
            p += 1
        }

        return res
    }
}

class TestSolution0870: XCTestCase {
    func test1() {
        let nums1 = [2, 7, 11, 15]
        let nums2 = [1, 10, 4, 11]
        let res = Solution().advantageCount(nums1, nums2)
        XCTAssertEqual(res, [2, 11, 7, 15])
    }

    func test2() {
        let nums1 = [12, 24, 8, 32]
        let nums2 = [13, 25, 32, 11]
        let res = Solution().advantageCount(nums1, nums2)
        XCTAssertEqual(res, [24, 32, 8, 12])
    }
}
