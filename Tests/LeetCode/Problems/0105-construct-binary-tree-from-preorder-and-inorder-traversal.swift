/**
# Construct Binary Tree from Preorder and Inorder Traversal

## Description

Given two integer arrays `preorder` and `inorder` where `preorder` is the
preorder traversal of a binary tree and `inorder` is the inorder traversal of
the same tree, construct and return _the binary tree_.



**Example 1:**

![](https://assets.leetcode.com/uploads/2021/02/19/tree.jpg)

    
    
    **Input:** preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
    **Output:** [3,9,20,null,null,15,7]
    

**Example 2:**

    
    
    **Input:** preorder = [-1], inorder = [-1]
    **Output:** [-1]
    



**Constraints:**

  * `1 <= preorder.length <= 3000`
  * `inorder.length == preorder.length`
  * `-3000 <= preorder[i], inorder[i] <= 3000`
  * `preorder` and `inorder` consist of **unique** values.
  * Each value of `inorder` also appears in `preorder`.
  * `preorder` is **guaranteed** to be the preorder traversal of the tree.
  * `inorder` is **guaranteed** to be the inorder traversal of the tree.



**Difficulty:** Medium\n
**Link**: <https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal>

*/

import XCTest
@testable import CSAlgorithm

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    // [节点值: 索引]
    var inPos: [Int: Int] = [:]

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for index in 0 ..< inorder.count {
            let element = inorder[index]
            inPos[element] = index
        }

        return _build(preorder, preStart: 0, preEnd: preorder.count - 1, inStart: 0)
    }

    /// 使用数组 `preorder` 在索引区间 `[preLeft, preRight]` 中的所有元素构造二叉树, 返回该二叉树的根节点
    private func _build(_ preorder: [Int], preStart: Int, preEnd: Int, inStart: Int) -> TreeNode? {
        if preStart > preEnd {
            return nil
        }

        let rootVal = preorder[preStart]
        let root = TreeNode(rootVal)
        let rootIdx = inPos[rootVal]!
        let len = rootIdx - inStart

        root.left = _build(preorder, preStart: preStart + 1, preEnd: preStart + len, inStart: inStart)
        root.right = _build(preorder, preStart: preStart + len + 1, preEnd: preEnd, inStart: rootIdx + 1)

        return root

    }
}

class TestSolution0105: XCTestCase {
    let root  = BinaryTreeNode(1)
    let node2 = BinaryTreeNode(2)
    let node3 = BinaryTreeNode(3)
    let node4 = BinaryTreeNode(4)
    let node5 = BinaryTreeNode(5)
    let node6 = BinaryTreeNode(6)
    let node7 = BinaryTreeNode(7)
    let node8 = BinaryTreeNode(8)

    override func setUp() {
    /*
             1
            / \
           2   3
          / \   \
         4   5   6
            / \
           7   8
    */
        root.left = node2
        root.right = node3

        node2.left = node4
        node2.right = node5

        node5.left = node7
        node5.right = node8

        node3.right = node6
    }

    func test1() {
        let preOrderArr = preOrderRecursive(root: root)
        let node = Solution().buildTree(preOrderArr, inOrderRecursive(root: root))
        XCTAssertEqual(preOrderRecursive(root: node), preOrderArr)
    }
}
