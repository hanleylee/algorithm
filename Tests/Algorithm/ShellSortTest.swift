//: [Previous](@previous)

@testable import CSAlgorithm
import Foundation
import XCTest

final class ShellSortTest: XCTestCase {
    func test1() {
        var arr = [64, 20, 50, 33, 72, 10, 23, -1, 4, 5]

        shellSort(&arr)
    }

    func test2() {}
}
