import XCTest
/*
 * @lc app=leetcode.cn id=509 lang=swift
 *
 * [509] 斐波那契数
 *
 * https://leetcode-cn.com/problems/fibonacci-number/description/
 *
 * algorithms
 * Easy (66.18%)
 * Likes:    168
 * Dislikes: 0
 * Total Accepted:    85.4K
 * Total Submissions: 129K
 * Testcase Example:  '2'
 *
 * 斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
 *
 * F(0) = 0,   F(1) = 1
 * F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 *
 *
 * 给定 N，计算 F(N)。
 *
 *
 *
 * 示例 1：
 *
 * 输入：2
 * 输出：1
 * 解释：F(2) = F(1) + F(0) = 1 + 0 = 1.
 *
 *
 * 示例 2：
 *
 * 输入：3
 * 输出：2
 * 解释：F(3) = F(2) + F(1) = 1 + 1 = 2.
 *
 *
 * 示例 3：
 *
 * 输入：4
 * 输出：3
 * 解释：F(4) = F(3) + F(2) = 2 + 1 = 3.
 *
 *
 *
 *
 * 提示：
 *
 *
 * 0 ≤ N ≤ 30
 *
 *
 */

final class fibsTest: XCTestCase {
    func test1() {
        XCTAssertEqual(fib(4), 3)
    }

    func test2() {}
}

var temp: [Int: Int] = [:]
private func fib(_ N: Int) -> Int {
    if N == 0 {
        return 0
    } else if N == 1 {
        return 1
    } else {
        if let res = temp[N] {
            return res
        } else {
            let r = fib(N - 1) + fib(N - 2)
            temp[N] = r
            return r
        }
    }
}

// @lc code=end
