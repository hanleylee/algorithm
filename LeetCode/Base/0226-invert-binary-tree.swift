/**
 # Invert Binary Tree

 ## Description

 Given the `root` of a binary tree, invert the tree, and return _its root_.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/03/14/invert1-tree.jpg)

     **Input:** root = [4,2,7,1,3,6,9]
     **Output:** [4,7,2,9,6,3,1]

 **Example 2:**

 ![](https://assets.leetcode.com/uploads/2021/03/14/invert2-tree.jpg)

     **Input:** root = [2,1,3]
     **Output:** [2,3,1]

 **Example 3:**

     **Input:** root = []
     **Output:** []

 **Constraints:**

   * The number of nodes in the tree is in the range `[0, 100]`.
   * `-100 <= Node.val <= 100`

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/invert-binary-tree>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let left = invertTree(root.left)
        let right = invertTree(root.right)
        let tmp = left

        root.left = right
        root.right = tmp

        return root
    }
}

class TestSolution0226: XCTestCase {
    func test1() {}
}
