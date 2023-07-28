//
//  BniaryTreeTest.swift
//
//
//  Created by Hanley Lee on 2023/6/11.
//

import CSAlgorithm
import XCTest

final class BniaryTreeTest: XCTestCase {
    func test1() {
        // leaf nodes
        let node5 = BinaryTree.node(.empty, "5", .empty)
        let nodeA = BinaryTree.node(.empty, "a", .empty)
        let node10 = BinaryTree.node(.empty, "10", .empty)
        let node4 = BinaryTree.node(.empty, "4", .empty)
        let node3 = BinaryTree.node(.empty, "3", .empty)
        let nodeB = BinaryTree.node(.empty, "b", .empty)

        // intermediate nodes on the left
        let aMinus10 = BinaryTree.node(nodeA, "-", node10)
        let timesLeft = BinaryTree.node(node5, "*", aMinus10)

        // intermediate nodes on the right
        let minus4 = BinaryTree.node(.empty, "-", node4)
        let divide3andB = BinaryTree.node(node3, "/", nodeB)
        let timesRight = BinaryTree.node(minus4, "*", divide3andB)

        // root node
        let tree = BinaryTree.node(timesLeft, "+", timesRight)

        print(tree)
        print(tree.count) // 12

        // tree.traverseInOrder { s in print(s) }
        // tree.traversePreOrder { s in print(s) }
        tree.traversePostOrder { s in print(s) }
    }
}
