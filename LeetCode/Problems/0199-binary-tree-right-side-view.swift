/**
 # Binary Tree Right Side View

 ## Description

 Given the `root` of a binary tree, imagine yourself standing on the **right
 side** of it, return _the values of the nodes you can see ordered from top to
 bottom_.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/02/14/tree.jpg)

     **Input:** root = [1,2,3,null,5,null,4]
     **Output:** [1,3,4]

 **Example 2:**

     **Input:** root = [1,null,3]
     **Output:** [1,3]

 **Example 3:**

     **Input:** root = []
     **Output:** []

 **Constraints:**

   * The number of nodes in the tree is in the range `[0, 100]`.
   * `-100 <= Node.val <= 100`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/binary-tree-right-side-view>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []

        guard let root = root else { return res }

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let count = queue.count

            for i in 0 ..< count {
                let node = queue.removeFirst()
                if i == count - 1 {
                    res.append(node.val)
                }

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }
        }

        return res
    }
}

class TestSolution0199: XCTestCase {
    func test1() {}
}
