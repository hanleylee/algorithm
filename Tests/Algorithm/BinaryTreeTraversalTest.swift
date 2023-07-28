@testable import CSAlgorithm
import XCTest

// func inOrder3(root: BinaryTreeNode<Int>?) -> [Int] {
//
// }

final class BinaryTreeTraversalTest: XCTestCase {
    let root  = BinaryTreeNode(1)
    let node2 = BinaryTreeNode(2)
    let node3 = BinaryTreeNode(3)
    let node4 = BinaryTreeNode(4)
    let node5 = BinaryTreeNode(5)
    let node6 = BinaryTreeNode(6)
    let node7 = BinaryTreeNode(7)
    let node8 = BinaryTreeNode(8)

    override func setUpWithError() throws {
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

    func testPreOrderRecursive() {
        XCTAssertEqual(preOrderRecursive(root: root), [1, 2, 4, 5, 7, 8, 3, 6])
    }

    func testPreOrderTraverse1() {
        XCTAssertEqual(preOrderTraverse1(root: root), [1, 2, 4, 5, 7, 8, 3, 6])
    }

    func testPreOrderTraverse2() {
        XCTAssertEqual(preOrderTraverse2(root: root), [1, 2, 4, 5, 7, 8, 3, 6])
    }

    func testInOrderRecursive() {
        XCTAssertEqual(inOrderRecursive(root: root), [4, 2, 7, 5, 8, 1, 3, 6])
    }

    func testInOrderTraverse() {
        XCTAssertEqual(inOrderTraverse(root: root), [4, 2, 7, 5, 8, 1, 3, 6])
    }

    func testPostOrderRecursive() {
        XCTAssertEqual(postOrderRecursive(root: root), [4, 7, 8, 5, 2, 6, 3, 1])
    }
}
