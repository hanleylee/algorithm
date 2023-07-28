/* 从尾到头打印链表的值 */

import Foundation

// Stack
struct Stack<Element> {
    var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }
}

// ListNode
class ListNode {
    var val: Int = 0
    var next: ListNode?
}

// Print List
func printListFromTailToHead(root: ListNode?) {
    var stack = Stack<ListNode>()

    var newRoot = root
    while let r = newRoot {
        stack.push(r)
        newRoot = r.next
    }

    var tmp: ListNode?
    while !stack.isEmpty {
        tmp = stack.pop()
        print(tmp?.val)
    }
}

// 递归
func printNodeUsingRecursion(node: ListNode) {
    print("递归:", node.val)

    if node.next == nil { // 终止条件
        print("10\(node.val)")
    }

    if node.next != nil {
        printNodeUsingRecursion(node: node.next!)
        print("20\(node.val)")
    }
}

// Test
func provideTestNode() -> ListNode {
    let node1 = ListNode()
    node1.val = 1

    let node2 = ListNode()
    node2.val = 2
    node1.next = node2

    let node3 = ListNode()
    node3.val = 3
    node2.next = node3

    return node1
}

let root = provideTestNode()
printListFromTailToHead(root: root)
printNodeUsingRecursion(node: root)
