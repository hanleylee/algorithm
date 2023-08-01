/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 *
 * https://leetcode-cn.com/problems/add-two-numbers/description/
 *
 * algorithms
 * Medium (38.64%)
 * Likes:    5050
 * Dislikes: 0
 * Total Accepted:    585.9K
 * Total Submissions: 1.5M
 * Testcase Example:  '[2,4,3]\n[5,6,4]'
 *
 * 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 *
 * 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 *
 * 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 *
 * 示例：
 *
 * 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 * 输出：7 -> 0 -> 8
 * 原因：342 + 465 = 807
 *
 *
 */
import CSAlgorithm
import XCTest

private typealias ListNode = CSAlgorithm.ListNode<Int>

private class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil, l2 == nil {
            return nil
        }

        let res = ListNode(0)
        var cur: ListNode? = res
        var extra = 0
        var _l1 = l1
        var _l2 = l2

        while _l1 != nil || _l2 != nil {
            let val = (_l1?.val ?? 0) + (_l2?.val ?? 0) + extra
            extra = val / 10
            let node = ListNode(val % 10)
            cur?.next = node
            cur = cur?.next
            _l1 = _l1?.next
            _l2 = _l2?.next
        }

        if extra != 0 {
            let node = ListNode(extra)
            cur?.next = node
        }

        return res.next
    }
}

class TestSolution0002: XCTestCase {
    func test1() {
        let sol = Solution()
        let l1 = ListNode.create(with: [2, 4, 3])
        let l2 = ListNode.create(with: [5, 6, 4])

        let res = sol.addTwoNumbers(l1, l2)
        XCTAssertEqual(res?.description, "[7, 0, 8]")
    }

    func test2() {
        let sol = Solution()
        let l1 = ListNode.create(with: [9, 9, 9, 9, 9, 9, 9])
        let l2 = ListNode.create(with: [9, 9, 9, 9])

        let res = sol.addTwoNumbers(l1, l2)
        XCTAssertEqual(res?.description, "[8, 9, 9, 9, 0, 0, 0, 1]")
    }
}
