/**

 # Merge Sorted Array

 ## Description

 You are given two integer arrays `nums1` and `nums2`, sorted in **non-
 decreasing order** , and two integers `m` and `n`, representing the number of
 elements in `nums1` and `nums2` respectively.

 **Merge** `nums1` and `nums2` into a single array sorted in **non-decreasing
 order**.

 The final sorted array should not be returned by the function, but instead be
 _stored inside the array_`nums1`. To accommodate this, `nums1` has a length of
 `m + n`, where the first `m` elements denote the elements that should be
 merged, and the last `n` elements are set to `0` and should be ignored.
 `nums2` has a length of `n`.

 **Example 1:**

     **Input:** nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     **Output:** [1,2,2,3,5,6]
     **Explanation:** The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [ _1_ , _2_ ,2, _3_ ,5,6] with the underlined elements coming from nums1.

 **Example 2:**

     **Input:** nums1 = [1], m = 1, nums2 = [], n = 0
     **Output:** [1]
     **Explanation:** The arrays we are merging are [1] and [].
     The result of the merge is [1].

 **Example 3:**

     **Input:** nums1 = [0], m = 0, nums2 = [1], n = 1
     **Output:** [1]
     **Explanation:** The arrays we are merging are [] and [1].
     The result of the merge is [1].
     Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.

 **Constraints:**

   * `nums1.length == m + n`
   * `nums2.length == n`
   * `0 <= m, n <= 200`
   * `1 <= m + n <= 200`
   * `-109 <= nums1[i], nums2[j] <= 109`

 **Follow up:** Can you come up with an algorithm that runs in `O(m + n)` time?

 **Difficulty:** Easy

 **Link**: <https://leetcode-cn.com/problems/merge-sorted-array>

 */

import XCTest

private class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var l1 = m - 1
        var l2 = n - 1

        while l1 >= 0, l2 >= 0 {
            let element1 = nums1[l1]
            let element2 = nums2[l2]

            if element1 > element2 {
                nums1[l1 + l2 + 1] = element1
                l1 -= 1
            } else {
                nums1[l1 + l2 + 1] = element2
                l2 -= 1
            }
        }

        if l1 < 0 {
            for i in (0 ... l2).reversed() {
                nums1[i] = nums2[i]
            }
        }
    }
}

class TestSolution0088: XCTestCase {
    func test1() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let nums2 = [2, 5, 6]
        Solution().merge(&nums1, 3, nums2, 3)
        XCTAssertEqual(nums1, [1, 2, 2, 3, 5, 6])
    }

    func test2() {
        var nums1 = [1]
        let nums2: [Int] = []
        Solution().merge(&nums1, 1, nums2, 0)
        XCTAssertEqual(nums1, [1])
    }
}
