/**
# Reverse Integer

## Description

Given a signed 32-bit integer `x`, return `x` _with its digits reversed_. If
reversing `x` causes the value to go outside the signed 32-bit integer range
`[-231, 231 - 1]`, then return `0`.

**Assume the environment does not allow you to store 64-bit integers (signed
or unsigned).**



**Example 1:**

    
    
    **Input:** x = 123
    **Output:** 321
    

**Example 2:**

    
    
    **Input:** x = -123
    **Output:** -321
    

**Example 3:**

    
    
    **Input:** x = 120
    **Output:** 21
    



**Constraints:**

  * `-231 <= x <= 231 - 1`



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/reverse-integer>

*/

import XCTest

private class Solution {
    func reverse(_ x: Int) -> Int {
        var isNegative = x < 0

        var absValue = abs(x)
        var numElements: [Int] = []

        while absValue > 0 {
            let reminder = absValue % 10
            absValue = absValue / 10
            numElements.append(reminder)
        }

        var res: Int = 0

        for element in numElements {
            if (Int32.max - Int32(element)) / 10 >= res {
                res = (res * 10) + element
            } else {
                return 0
            }
        }

        return isNegative ? -res : res

    }
}

class TestSolution0007: XCTestCase {
    func test1() {
        print(Solution().reverse(1463847412))
    }
}
