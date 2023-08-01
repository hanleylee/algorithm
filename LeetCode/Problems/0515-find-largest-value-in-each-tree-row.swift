/**
 # Find Largest Value in Each Tree Row

 ## Description

 Given the `root` of a binary tree, return _an array of the largest value in
 each row_ of the tree **(0-indexed)**.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2020/08/21/largest_e1.jpg)

     **Input:** root = [1,3,2,5,3,null,9]
     **Output:** [1,3,9]

 **Example 2:**

     **Input:** root = [1,2,3]
     **Output:** [1,3]

 **Constraints:**

   * The number of nodes in the tree will be in the range `[0, 104]`.
   * `-231 <= Node.val <= 231 - 1`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row>

 */

import CSAlgorithm
import XCTest

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []

        guard let root = root else { return res }

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let count = queue.count

            var maxValue: Int = .min

            for _ in 0 ..< count {
                let node = queue.removeFirst()
                maxValue = max(node.val, maxValue)

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            res.append(maxValue)
        }

        return res
    }
}

class TestSolution0515: XCTestCase {
    func test1() {}
}
