/**
 # Lowest Common Ancestor of a Binary Tree

 ## Description

 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes
 in the tree.

 According to the [definition of LCA on
 Wikipedia](https://en.wikipedia.org/wiki/Lowest_common_ancestor): "The lowest
 common ancestor is defined between two nodes `p` and `q` as the lowest node in
 `T` that has both `p` and `q` as descendants (where we allow **a node to be a
 descendant of itself** )."

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)

     **Input:** root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
     **Output:** 3
     **Explanation:** The LCA of nodes 5 and 1 is 3.

 **Example 2:**

 ![](https://assets.leetcode.com/uploads/2018/12/14/binarytree.png)

     **Input:** root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
     **Output:** 5
     **Explanation:** The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.

 **Example 3:**

     **Input:** root = [1,2], p = 1, q = 2
     **Output:** 1

 **Constraints:**

   * The number of nodes in the tree is in the range `[2, 105]`.
   * `-109 <= Node.val <= 109`
   * All `Node.val` are **unique**.
   * `p != q`
   * `p` and `q` will exist in the tree.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        return search(root, p, q)
    }

    func search(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        if root === p || root === q {
            return root
        }

        let left = search(root.left, p, q)
        let right = search(root.right, p, q)

        if left == nil, right == nil { // 不在左侧也不在右侧
            return nil
        } else if left != nil, right == nil { // 在左侧
            return left
        } else if left == nil, right != nil { // 在右侧
            return right
        } else if left != nil, right != nil { // 左侧右侧都有
            return root
        }

        return root
    }
}

class TestSolution0236: XCTestCase {
    func test1() {}
}
