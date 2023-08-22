/**

 # Minimum Depth of Binary Tree

 ## Description

 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root
 node down to the nearest leaf node.

 **Note:**  A leaf is a node with no children.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2020/10/12/ex_depth.jpg)

     **Input:** root = [3,9,20,null,null,15,7]
     **Output:** 2

 **Example 2:**

     **Input:** root = [2,null,3,null,4,null,5,null,6]
     **Output:** 5

 **Constraints:**

   * The number of nodes in the tree is in the range `[0, 105]`.
   * `-1000 <= Node.val <= 1000`

 **Difficulty:** Easy

 **Link**: <https://leetcode-cn.com/problems/minimum-depth-of-binary-tree>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        var res = 0
        guard let root = root else { return res }

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            res += 1

            let count = queue.count

            for _ in 0 ..< count {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return res
                }

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }
        }

        return 0
    }
}

class TestSolution0111: XCTestCase {
    func test1() {}
}
