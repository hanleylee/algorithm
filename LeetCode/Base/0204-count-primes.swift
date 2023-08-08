/**

 # Count Primes

 ## Description

 Given an integer `n`, return _the number of prime numbers that are strictly
 less than_ `n`.

 **Example 1:**

     **Input:** n = 10
     **Output:** 4
     **Explanation:** There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

 **Example 2:**

     **Input:** n = 0
     **Output:** 0

 **Example 3:**

     **Input:** n = 1
     **Output:** 0

 **Constraints:**

   * `0 <= n <= 5 * 106`

 **Difficulty:** Medium

 **Link**: <https://leetcode-cn.com/problems/count-primes>

 */

import XCTest

private class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var primeArr = Array(repeating: 1, count: n)

        for i in 2 ..< Int(pow(Double(n), 0.5)) + 1 {
            if primeArr[i] == 1 {
                for j in i ..< n {
                    guard i * j < n else { continue }
                    primeArr[i * j] = 0
                }
            }
        }

        return primeArr.filter { $0 == 1 }.count - 2
    }
}

class TestSolution0204: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().countPrimes(0), 0)
        XCTAssertEqual(Solution().countPrimes(2), 0)
        XCTAssertEqual(Solution().countPrimes(10), 4)
    }
}
