//
//  StackTest.swift
//
//
//  Created by Hanley Lee on 2023/6/11.
//

@testable import CSAlgorithm
import XCTest

final class StackTest: XCTestCase {
    func test1() {
        // Create a stack and put some elements on it already.
        var stackOfNames = Stack(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])

        // Add an element to the top of the stack.
        stackOfNames.push("Mike")

        // The stack is now ["Carl", "Lisa", "Stephanie", "Jeff", "Wade", "Mike"]
        XCTAssertEqual(stackOfNames.array, ["Carl", "Lisa", "Stephanie", "Jeff", "Wade", "Mike"])

        // Remove and return the first element from the stack. This returns "Mike".
        XCTAssertEqual(stackOfNames.pop(), "Mike")

        // Look at the first element from the stack.
        XCTAssertEqual(stackOfNames.top, "Wade")

        XCTAssertFalse(stackOfNames.isEmpty)
    }
}
