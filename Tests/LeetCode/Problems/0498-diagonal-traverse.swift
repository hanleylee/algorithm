/**
 # Diagonal Traverse

 ## Description

 Given an `m x n` matrix `mat`, return _an array of all the elements of the
 array in a diagonal order_.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/04/10/diag1-grid.jpg)

     **Input:** mat = [[1,2,3],[4,5,6],[7,8,9]]
     **Output:** [1,2,4,7,5,3,6,8,9]

 **Example 2:**

     **Input:** mat = [[1,2],[3,4]]
     **Output:** [1,2,3,4]

 **Constraints:**

   * `m == mat.length`
   * `n == mat[i].length`
   * `1 <= m, n <= 104`
   * `1 <= m * n <= 104`
   * `-105 <= mat[i][j] <= 105`

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/diagonal-traverse>

 */

import XCTest

private class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        var res: [Int] = []

        for sum in 0 ... (mat[0].count + mat.count - 2) { // 0 1 2 3 4
            let range: [Int] = (sum % 2 == 0) ? Array(0 ... sum).reversed() : Array(0 ... sum)
            for i in range {
                if i >= mat.count || (sum - i) >= mat[0].count {
                    continue
                }
                res.append(mat[i][sum - i])
            }
        }

        return res
    }
}

class TestSolution0498: XCTestCase {
    func test1() {
        let res = Solution().findDiagonalOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        XCTAssertEqual(res, [1, 2, 4, 7, 5, 3, 6, 8, 9])
    }

    func test2() {
        let res = Solution().findDiagonalOrder([[1, 2], [3, 4]])
        XCTAssertEqual(res, [1, 2, 3, 4])
    }
}
