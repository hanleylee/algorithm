/**
 # Palindrome Linked List

 ## Description

 Given the `head` of a singly linked list, return `true` if it is a palindrome.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/03/03/pal1linked-list.jpg)

     **Input:** head = [1,2,2,1]
     **Output:** true

 **Example 2:**

 ![](https://assets.leetcode.com/uploads/2021/03/03/pal2linked-list.jpg)

     **Input:** head = [1,2]
     **Output:** false

 **Constraints:**

   * The number of nodes in the list is in the range `[1, 105]`.
   * `0 <= Node.val <= 9`

 **Follow up:** Could you do it in `O(n)` time and `O(1)` space?

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/palindrome-linked-list>

 */

import CSAlgorithm
import XCTest

private typealias ListNode = CSAlgorithm.ListNode<Int>

private class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var reversedTail = reverseListNode(slow)
        var cur = head

        while reversedTail != nil {
            if reversedTail?.val != cur?.val {
                return false
            }
            reversedTail = reversedTail?.next
            cur = cur?.next
        }

        return true
    }

    func reverseListNode(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }

        let newHead: ListNode? = reverseListNode(head?.next)
        head?.next?.next = head
        head?.next = nil

        return newHead
    }
}

class TestSolution0234: XCTestCase {
    func test1() {
        let head = ListNode.create(with: [1, 2, 2, 1])
        XCTAssertTrue(Solution().isPalindrome(head))
    }

    func test2() {
        let head = ListNode.create(with: [1, 2])
        XCTAssertFalse(Solution().isPalindrome(head))
    }
}
