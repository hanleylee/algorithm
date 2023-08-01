/**
 # Average of Levels in Binary Tree

 ## Description

 Given the `root` of a binary tree, return _the average value of the nodes on
 each level in the form of an array_. Answers within `10-5` of the actual
 answer will be accepted.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/03/09/avg1-tree.jpg)

     **Input:** root = [3,9,20,null,null,15,7]
     **Output:** [3.00000,14.50000,11.00000]
     Explanation: The average value of nodes on level 0 is 3, on level 1 is 14.5, and on level 2 is 11.
     Hence return [3, 14.5, 11].

 **Example 2:**

 ![](https://assets.leetcode.com/uploads/2021/03/09/avg2-tree.jpg)

     **Input:** root = [3,9,20,15,7]
     **Output:** [3.00000,14.50000,11.00000]

 **Constraints:**

   * The number of nodes in the tree is in the range `[1, 104]`.
   * `-231 <= Node.val <= 231 - 1`

 **Difficulty:** Easy\n
 **Link**: <https://leetcode-cn.com/problems/average-of-levels-in-binary-tree>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var res: [Double] = []

        guard let root = root else { return res }

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let count = queue.count
            var level: [Int] = []

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

            let avg = Double(level.reduce(0, +)) / Double(count)
            res.append(avg)
        }

        return res
    }
}

class TestSolution0637: XCTestCase {
    func test1() {}
}
