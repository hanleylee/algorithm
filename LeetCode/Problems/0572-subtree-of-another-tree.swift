/**
 # Subtree of Another Tree

 ## Description

 Given the roots of two binary trees `root` and `subRoot`, return `true` if
 there is a subtree of `root` with the same structure and node values of`
 subRoot` and `false` otherwise.

 A subtree of a binary tree `tree` is a tree that consists of a node in `tree`
 and all of this node's descendants. The tree `tree` could also be considered
 as a subtree of itself.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/04/28/subtree1-tree.jpg)

     **Input:** root = [3,4,5,1,2], subRoot = [4,1,2]
     **Output:** true

 **Example 2:**

 ![](https://assets.leetcode.com/uploads/2021/04/28/subtree2-tree.jpg)

     **Input:** root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
     **Output:** false

 **Constraints:**

   * The number of nodes in the `root` tree is in the range `[1, 2000]`.
   * The number of nodes in the `subRoot` tree is in the range `[1, 1000]`.
   * `-104 <= root.val <= 104`
   * `-104 <= subRoot.val <= 104`

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/subtree-of-another-tree>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root else { return false }
        guard let subRoot = subRoot else { return true }

        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot) || isSameTree(root, subRoot)
    }

    func isSameTree(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }

        if root1 == nil || root2 == nil {
            return false
        }

        if root1?.val != root2?.val {
            return false
        }

        return isSameTree(root1?.left, root2?.left) && isSameTree(root1?.right, root2?.right)
    }
}

class TestSolution0572: XCTestCase {
    func test1() {}
}
