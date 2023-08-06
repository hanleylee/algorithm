/**
 # 圆圈中最后剩下的数字 LCOF

 ## Description

 English description is not available for the problem. Please switch to
 Chinese.

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof>

 */

import XCTest

private class Solution {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var killedArr: [Bool] = Array(repeating: false, count: n)
        var killedCount = 0

        var idx = 0

    l1: while true {
        let remain = n - killedCount

        if remain <= 1 {
            break
        }

        for i in 0 ..< m {
            while killedArr[idx] {
                idx = (idx + 1) % n
            }

            if i == m - 1 {
                killedArr[idx] = true
                killedCount += 1
                continue l1
            }

            idx = (idx + 1) % n
        }
    }

        let remainIdx = killedArr.firstIndex(where: { !$0 }) ?? 0

        return remainIdx
    }
}

class TestSolution剑指Offer62: XCTestCase {
    func test1() {
        XCTAssertEqual((Solution().lastRemaining(5, 3)), 3)
    }

    func test2() {
        XCTAssertEqual((Solution().lastRemaining(10, 17)), 2)
    }

//    func test3() {
//        XCTAssertEqual((Solution().lastRemaining(7086, 11692)), 2)
//    }
}
