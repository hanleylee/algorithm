/*
 * Given a non-negative integer `x`, return *the square root of *`x`* rounded down
 * to the nearest integer*. The returned integer should be non-negative as
 * well.
 *
 * You must not use any built-in exponent function or operator.
 *
 * * For example, do not use `pow(x, 0.5)` in c++ or `x  0.5` in python.
 *
 *
 * Example 1:
 *
 * Input: x = 4
 * Output: 2
 * Explanation: The square root of 4 is 2, so we return 2.
 *
 * Example 2:
 *
 * Input: x = 8
 * Output: 2
 * Explanation: The square root of 8 is 2.82842..., and since we round it down
 * to the nearest integer, 2 is returned.
 *
 *
 * Constraints:
 *
 * * `0 <= x <= 231 - 1`
 *
 */

import XCTest

private class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x

        var final = 0
        while left <= right {
            let mid = left + (right - left) / 2
            let res = mid * mid
            if res == x {
                return mid
            } else if res > x {
                right = mid - 1
            } else if res < x {
                left = mid + 1
                final = mid
            }
        }

        return final
    }
}

class TestSolution0069: XCTestCase {
    func test1() {
        let sol = Solution()
        XCTAssertEqual(sol.mySqrt(0), 0)
        XCTAssertEqual(sol.mySqrt(3), 1)
        XCTAssertEqual(sol.mySqrt(5), 2)
        XCTAssertEqual(sol.mySqrt(8), 2)
        XCTAssertEqual(sol.mySqrt(9), 3)
    }
}
