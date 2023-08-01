/**

 # Sliding Window Maximum

 ## Description

 You are given an array of integers `nums`, there is a sliding window of size
 `k` which is moving from the very left of the array to the very right. You can
 only see the `k` numbers in the window. Each time the sliding window moves
 right by one position.

 Return _the max sliding window_.

 **Example 1:**

     **Input:** nums = [1,3,-1,-3,5,3,6,7], k = 3
     **Output:** [3,3,5,5,6,7]
     **Explanation:**
     Window position                Max
     ---------------               -----
     [1  3  -1] -3  5  3  6  7       **3**
      1 [3  -1  -3] 5  3  6  7       **3**
      1  3 [-1  -3  5] 3  6  7      **5**
      1  3  -1 [-3  5  3] 6  7       **5**
      1  3  -1  -3 [5  3  6] 7       **6**
      1  3  -1  -3  5 [3  6  7]      **7**

 **Example 2:**

     **Input:** nums = [1], k = 1
     **Output:** [1]

 **Constraints:**

   * `1 <= nums.length <= 105`
   * `-104 <= nums[i] <= 104`
   * `1 <= k <= nums.length`

 **Difficulty:** Hard

 **Link**: <https://leetcode-cn.com/problems/sliding-window-maximum>

 */

import XCTest

private class Solution {
    // 动态规划
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var dpTable: [[Int]] = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)

        for i in 0 ..< nums.count {
            for j in i ..< nums.count {
                if i == j {
                    dpTable[i][j] = nums[i]
                } else {
                    dpTable[i][j] = max(dpTable[i][j-1], nums[j])
                }
            }
        }

        var res: [Int] = []

        for i in 0 ... (nums.count-k) {
            res.append(dpTable[i][i+k-1])
        }

        return res
    }

    // 动态规划
    func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count * k == 0 {
            return [0]
        } else if k == 1 {
            return nums
        }

        var dpLeft = [Int](repeating: 0, count: nums.count)
        dpLeft[0] = nums[0]

        var dpRight = [Int](repeating: 0, count: nums.count)
        dpRight[nums.count-1] = nums[nums.count-1]

        for i in 1 ..< nums.count {
            //! 1
            if i % k == 0 {
                dpLeft[i] = nums[i]
            } else {
                dpLeft[i] = max(dpLeft[i-1], nums[i])
            }
            //! 2
            let j = nums.count-i-1
            if (j+1) % k == 0 {
                dpRight[j] = nums[j]
            } else {
                dpRight[j] = max(dpRight[j+1], nums[j])
            }
        }

        var output = [Int](repeating: 0, count: nums.count-k+1)
        for i in 0 ..< nums.count-k+1 {
            output[i] = max(dpLeft[i+k-1], dpRight[i])
        }

        return output
    }

    // 双端队列
    func maxSlidingWindow3(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count < k {
            return []
        }

        var windows = [Int]()
        var res = [Int]()

        for (i, x) in nums.enumerated() {
            //! 1. 队头出局 因为 i 是窗口右侧，所以 i >= k 的时候才说明已经出现了窗口
            if i >= k, windows[0] <= i-k {
                windows.removeFirst()
            }
            //! 2. 队尾 小于当前元素，出队
            while !windows.isEmpty, nums[windows.last!] <= x {
                windows.popLast()
            }
            //! 3.添加当前元素入队
            windows.append(i)
            //! 4. 取队头
            if i >= k-1 {
                res.append(nums[windows[0]])
            }
        }
        return res
    }

    // 暴力法, 超时
    func maxSlidingWindow4(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int](repeating: 0, count: nums.count-k+1)

        for i in 0 ... nums.count-k {
            var maxValue = Int.min
            for j in i ..< i+k {
                maxValue = max(maxValue, nums[j])
            }
            res[i] = maxValue
        }
        return res
    }
}

class TestSolution0239: XCTestCase {
    func test1() {
        let nums = [1, 3, -1, -3, 5, 3, 6, 7]
        XCTAssertEqual(Solution().maxSlidingWindow(nums, 3), [3, 3, 5, 5, 6, 7])
    }

    func test2() {
        let nums = [1]
        XCTAssertEqual(Solution().maxSlidingWindow(nums, 1), [1])
    }
}
