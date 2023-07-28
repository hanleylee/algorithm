//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/6/11.
//

@testable import CSAlgorithm
import XCTest

final class LinkedListTest: XCTestCase {
    func test1() {
        let list = LinkedList<String>()
        XCTAssertEqual(list.isEmpty, true)
        XCTAssertNil(list.head)
        XCTAssertNil(list.last)

        list.append("Hello")
        XCTAssertEqual(list.isEmpty, false)
        XCTAssertEqual(list.head!.value, "Hello")
        XCTAssertEqual(list.last!.value, "Hello")
        XCTAssertEqual(list.count, 1) // 1

        list.append("World")
        XCTAssertEqual(list.head?.value, "Hello")
        XCTAssertEqual(list.last?.value, "World")
        XCTAssertEqual(list.count, 2) // 2
        XCTAssertNil(list.head?.previous)
        XCTAssertEqual(list.head?.next!.value, "World")
        XCTAssertEqual(list.last?.previous!.value, "Hello")
        XCTAssertNil(list.last?.next) // nil

        XCTAssertEqual(list.node(at: 0).value, "Hello")
        XCTAssertEqual(list.node(at: 1).value, "World")

        XCTAssertEqual(list[0], "Hello")
        XCTAssertEqual(list[1], "World")

        let list2 = LinkedList<String>()
        list2.append("Goodbye")
        list2.append("World")
        list.append(list2)
        list2.removeAll()
        XCTAssertTrue(list2.isEmpty)
        list.removeLast()
        list.remove(at: 2)

        list.insert("Swift", at: 1)
        XCTAssertEqual(list[0], "Hello")
        XCTAssertEqual(list[1], "Swift")
        XCTAssertEqual(list[2], "World")

        list.reverse()

        list.node(at: 0).value = "Universe"
        list.node(at: 1).value = "Swifty"
        let m = list.map { s in s.count }.description
        XCTAssertEqual(m, "[8, 6, 5]")
        let f = list.filter { s in s.count > 5 }
        XCTAssertEqual(f.description, "[Universe, Swifty]")

        list.remove(node: list.head!)
        XCTAssertEqual(list.count, 2)
        XCTAssertEqual(list[0], "Swifty")
        XCTAssertEqual(list[1], "Hello")

        list.removeLast()
        XCTAssertEqual(list.head?.value, "Swifty")
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list[0], "Swifty")

        list.remove(at: 0)
        XCTAssertEqual(list.count, 0)
    }

    func test3() {
        let list3 = LinkedList<String>()
        list3.insert("2", at: 0)
        XCTAssertEqual(list3.count, 1)
        list3.insert("4", at: 1)
        XCTAssertEqual(list3.count, 2)
        list3.insert("5", at: 2)
        XCTAssertEqual(list3.count, 3)
        list3.insert("3", at: 1)
        list3.insert("1", at: 0)

        let list4 = LinkedList<String>()
        list4.insert(list3, at: 0)
        XCTAssertEqual(list4.count, 5)

        let list5 = LinkedList<String>()
        list5.append("0")
        list5.insert("End", at: 1)
        XCTAssertEqual(list5.count, 2)
        list5.insert(list4, at: 1)
        XCTAssertEqual(list5.count, 7)
    }

    func test4() {
        let linkedList: LinkedList<Int> = [1, 2, 3, 4]
        XCTAssertEqual(linkedList.count, 4)
        XCTAssertEqual(linkedList[0], 1)

        // Infer the type from the array
        let listArrayLiteral2: LinkedList = ["Swift", "Algorithm", "Club"]
        XCTAssertEqual(listArrayLiteral2.count, 3)
        XCTAssertEqual(listArrayLiteral2[0], "Swift")
        XCTAssertEqual(listArrayLiteral2.removeLast(), "Club")

        // Conformance to the Collection protocol
        let collection: LinkedList<Int> = [1, 2, 3, 4, 5]
        let index2 = collection.index(collection.startIndex, offsetBy: 2)
        let value = collection[index2] // 3
        XCTAssertEqual(value, 3)

        // Iterating in a for loop, since the Sequence protocol allows this.
        var sum = 0
        for element in collection {
            sum += element
        }

        XCTAssertEqual(sum, 15)

        let result = collection.reduce(0) { $0 + $1 }
        XCTAssertEqual(result, 15)
    }
}
