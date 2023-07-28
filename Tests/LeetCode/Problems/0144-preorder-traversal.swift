import CSAlgorithm
import XCTest
/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-preorder-traversal/description/
 *
 * algorithms
 * Medium (67.13%)
 * Likes:    451
 * Dislikes: 0
 * Total Accepted:    223.2K
 * Total Submissions: 326.1K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：root = [1,null,2,3]
 * 输出：[1,2,3]
 *
 *
 * 示例 2：
 *
 *
 * 输入：root = []
 * 输出：[]
 *
 *
 * 示例 3：
 *
 *
 * 输入：root = [1]
 * 输出：[1]
 *
 *
 * 示例 4：
 *
 *
 * 输入：root = [1,2]
 * 输出：[1,2]
 *
 *
 * 示例 5：
 *
 *
 * 输入：root = [1,null,2]
 * 输出：[1,2]
 *
 *
 *
 *
 * 提示：
 *
 *
 * 树中节点数目在范围 [0, 100] 内
 * -100
 *
 *
 *
 *
 * 进阶：递归算法很简单，你可以通过迭代算法完成吗？
 *
 */

// @lc code=start

// 递归解法
private func preorderTraversal1(_ root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }
    return [root.val] + preorderTraversal1(root.left) + preorderTraversal1(root.right)
}

// 迭代解法
private func preorderTraversal2(_ root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }
    var res: [Int] = []
    var stack: [BinaryTreeNode] = [root]

    while let node = stack.popLast() {
        res.append(node.val)
        if let right = node.right { stack.append(right) }
        if let left = node.left { stack.append(left) }
    }
    return res
}

// @lc code=end
