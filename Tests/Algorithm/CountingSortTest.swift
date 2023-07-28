@testable import CSAlgorithm
import Foundation
import XCTest

final class countingSortTest: XCTestCase {
    func test1() {
        XCTAssertNotNil(try? countingSort(array: [10, 9, 8, 7, 1, 2, 7, 3]))
    }

    func test2() {}
}
