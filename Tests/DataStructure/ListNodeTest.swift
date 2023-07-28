//
//  ListNodeTest.swift
//
//
//  Created by Hanley Lee on 2023/7/9.
//

import CSAlgorithm
import XCTest

final class ListNodeTest: XCTestCase {
    func testListNodeCreate() {
        let arr = [1, 2, 3]
        let node = ListNode.create(with: arr)

        XCTAssertEqual(node?.description, "[1, 2, 3]")
    }
}
