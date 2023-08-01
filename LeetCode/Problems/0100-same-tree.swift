/**
# Same Tree

## Description

Given the roots of two binary trees `p` and `q`, write a function to check if
they are the same or not.

Two binary trees are considered the same if they are structurally identical,
and the nodes have the same value.



**Example 1:**

![](https://assets.leetcode.com/uploads/2020/12/20/ex1.jpg)

    
    
    **Input:** p = [1,2,3], q = [1,2,3]
    **Output:** true
    

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/12/20/ex2.jpg)

    
    
    **Input:** p = [1,2], q = [1,null,2]
    **Output:** false
    

**Example 3:**

![](https://assets.leetcode.com/uploads/2020/12/20/ex3.jpg)

    
    
    **Input:** p = [1,2,1], q = [1,1,2]
    **Output:** false
    



**Constraints:**

  * The number of nodes in both trees is in the range `[0, 100]`.
  * `-104 <= Node.val <= 104`



**Difficulty:** Easy\n
**Link**: <https://leetcode-cn.com/problems/same-tree>

*/

import XCTest
import CSAlgorithm

private typealias TreeNode = CSAlgorithm.BinaryTreeNode<Int>

private class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }

        if p?.val != q?.val {
            return false
        }

        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

class TestSolution0100: XCTestCase {
    func test1() {

    }
}
