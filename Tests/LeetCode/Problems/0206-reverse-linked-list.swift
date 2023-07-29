/*
 * Given the `head` of a singly linked list, reverse the list, and return *the
 * reversed list*.
 *
 *
 * Example 1:
 *
 * []
 * Input: head = [1,2,3,4,5]
 * Output: [5,4,3,2,1]
 *
 * Example 2:
 *
 * []
 * Input: head = [1,2]
 * Output: [2,1]
 *
 * Example 3:
 *
 * Input: head = []
 * Output: []
 *
 *
 * Constraints:
 *
 * * The number of nodes in the list is the range `[0, 5000]`.
 * * `-5000 <= Node.val <= 5000`
 *
 *
 * Follow up: A linked list can be reversed either iteratively or recursively.
 * Could you implement both?
 *
 */

import CSAlgorithm
import XCTest

private typealias ListNode = CSAlgorithm.ListNode<Int>

private class Solution {
    // 迭代法
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        var pre: ListNode? = head
        var cur: ListNode? = head?.next
        var next: ListNode? = head?.next?.next

        cur?.next = pre
        pre?.next = nil
        pre = cur
        cur = next
        next = next?.next

        while cur != nil {
            cur?.next = pre
            pre = cur
            cur = next
            next = next?.next
        }

        return pre
    }

    // 递归法
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }

        let newHead = reverseList2(head?.next)
        head?.next?.next = head
        head?.next = nil

        return newHead
    }
}

class TestSolution0206: XCTestCase {
    func test1() {
        let head = ListNode.create(with: [1, 2, 3, 4, 5])
        let reverseHead = Solution().reverseList(head)
        XCTAssertEqual(reverseHead?.description, "[5, 4, 3, 2, 1]")
    }

    func test2() {
        let head = ListNode.create(with: [1, 2, 3, 4, 5])
        let reverseHead = Solution().reverseList2(head)
        XCTAssertEqual(reverseHead?.description, "[5, 4, 3, 2, 1]")
    }
}
