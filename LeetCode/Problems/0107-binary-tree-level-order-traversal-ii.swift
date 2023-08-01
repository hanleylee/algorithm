/**
 # Binary Tree Level Order Traversal II

 ## Description

 Given the `root` of a binary tree, return _the bottom-up level order traversal
 of its nodes ' values_. (i.e., from left to right, level by level from leaf to
 root).

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)

     **Input:** root = [3,9,20,null,null,15,7]
     **Output:** [[15,7],[9,20],[3]]

 **Example 2:**

     **Input:** root = [1]
     **Output:** [[1]]

 **Example 3:**

     **Input:** root = []
     **Output:** []

 **Constraints:**

   * The number of nodes in the tree is in the range `[0, 2000]`.
   * `-1000 <= Node.val <= 1000`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []

        guard let root = root else { return res }

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            var level: [Int] = []

            let count = queue.count
            for _ in 0 ..< count {
                let node = queue.removeFirst()
                level.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }

            res.append(level)
        }

        return res.reversed()
    }
}

class TestSolution0107: XCTestCase {
    func test1() {}
}
