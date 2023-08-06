/**
 # Coin Change

 ## Description

 You are given an integer array `coins` representing coins of different
 denominations and an integer `amount` representing a total amount of money.

 Return _the fewest number of coins that you need to make up that amount_. If
 that amount of money cannot be made up by any combination of the coins, return
 `-1`.

 You may assume that you have an infinite number of each kind of coin.

 **Example 1:**

     **Input:** coins = [1,2,5], amount = 11
     **Output:** 3
     **Explanation:** 11 = 5 + 5 + 1

 **Example 2:**

     **Input:** coins = [2], amount = 3
     **Output:** -1

 **Example 3:**

     **Input:** coins = [1], amount = 0
     **Output:** 0

 **Constraints:**

   * `1 <= coins.length <= 12`
   * `1 <= coins[i] <= 231 - 1`
   * `0 <= amount <= 104`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/coin-change>

 */

import XCTest

private class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp: [Int] = Array(repeating: Int.max, count: amount + 1)
        dp[0] = 0

        for i in 0 ... amount {
            for coin in coins {
                if coin == i {
                    dp[i] = 1
                    continue
                }

                if i - coin > 0, dp[i - coin] != Int.max {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}

class TestSolution0322: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().coinChange([1, 2, 5], 11), 3)
    }

    func test2() {
        XCTAssertEqual(Solution().coinChange([2], 3), -1)
    }
}
