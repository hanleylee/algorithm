/**
 # Remove Linked List Elements

 ## Description

 Given the `head` of a linked list and an integer `val`, remove all the nodes
 of the linked list that has `Node.val == val`, and return _the new head_.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/03/06/removelinked-list.jpg)

     **Input:** head = [1,2,6,3,4,5,6], val = 6
     **Output:** [1,2,3,4,5]

 **Example 2:**

     **Input:** head = [], val = 1
     **Output:** []

 **Example 3:**

     **Input:** head = [7,7,7,7], val = 7
     **Output:** []

 **Constraints:**

   * The number of nodes in the list is in the range `[0, 104]`.
   * `1 <= Node.val <= 50`
   * `0 <= val <= 50`

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/remove-linked-list-elements>

 */

import CSAlgorithm
import XCTest

private typealias ListNode = CSAlgorithm.ListNode<Int>

private class Solution {
    /**
     使用快慢指针
     */
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var cur: ListNode? = dummy
        var fast: ListNode? = head

        while fast != nil {
            while fast?.val == val {
                fast = fast?.next
            }
            cur?.next = fast
            cur = cur?.next
            fast = fast?.next
        }

        return dummy.next
    }
}

class TestSolution0203: XCTestCase {
    func test1() {
        let head = ListNode.create(with: [1, 2, 6, 3, 4, 5, 6])
        let newHead = Solution().removeElements(head, 6)
        XCTAssertEqual(newHead?.description, "[1, 2, 3, 4, 5]")
    }

    func test2() {
        let head = ListNode.create(with: [])
        let newHead = Solution().removeElements(head, 1)
        XCTAssertEqual(newHead?.description, nil)
    }

    func test3() {
        let head = ListNode.create(with: [7, 7, 7, 7])
        let newHead = Solution().removeElements(head, 7)
        XCTAssertEqual(newHead?.description, nil)
    }
}
