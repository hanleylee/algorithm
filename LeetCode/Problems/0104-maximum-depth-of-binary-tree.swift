/**
 # Maximum Depth of Binary Tree

 ## Description

 Given the `root` of a binary tree, return _its maximum depth_.

 A binary tree's **maximum depth**  is the number of nodes along the longest
 path from the root node down to the farthest leaf node.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2020/11/26/tmp-tree.jpg)

     **Input:** root = [3,9,20,null,null,15,7]
     **Output:** 3

 **Example 2:**

     **Input:** root = [1,null,2]
     **Output:** 2

 **Constraints:**

   * The number of nodes in the tree is in the range `[0, 104]`.
   * `-100 <= Node.val <= 100`

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/maximum-depth-of-binary-tree>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        var level = 0

        guard let root = root else { return level }
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let count = queue.count

            for _ in 0 ..< count {
                let node = queue.removeFirst()

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            level += 1
        }

        return level
    }
}

class TestSolution0104: XCTestCase {
    func test1() {}
}
