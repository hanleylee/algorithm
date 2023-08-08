/**
 # LRU Cache

 ## Description

 Design a data structure that follows the constraints of a **[Least Recently
 Used (LRU)
 cache](https://en.wikipedia.org/wiki/Cache_replacement_policies#LRU)**.

 Implement the `LRUCache` class:

   * `LRUCache(int capacity)` Initialize the LRU cache with **positive** size `capacity`.
   * `int get(int key)` Return the value of the `key` if the key exists, otherwise return `-1`.
   * `void put(int key, int value)` Update the value of the `key` if the `key` exists. Otherwise, add the `key-value` pair to the cache. If the number of keys exceeds the `capacity` from this operation, **evict** the least recently used key.

 The functions `get` and `put` must each run in `O(1)` average time complexity.

 **Example 1:**

     **Input**
     ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
     [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
     **Output**
     [null, null, null, 1, null, -1, null, -1, 3, 4]

     **Explanation**
     LRUCache lRUCache = new LRUCache(2);
     lRUCache.put(1, 1); // cache is {1=1}
     lRUCache.put(2, 2); // cache is {1=1, 2=2}
     lRUCache.get(1);    // return 1
     lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
     lRUCache.get(2);    // returns -1 (not found)
     lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
     lRUCache.get(1);    // return -1 (not found)
     lRUCache.get(3);    // return 3
     lRUCache.get(4);    // return 4

 **Constraints:**

   * `1 <= capacity <= 3000`
   * `0 <= key <= 104`
   * `0 <= value <= 105`
   * At most 2` * 105` calls will be made to `get` and `put`.

 **Difficulty:** Medium\n
 **Link**: <https://leetcode-cn.com/problems/lru-cache>

 */

import XCTest

class DoubleList {
    class Node {
        var key: Int
        var val: Int
        var next: Node?
        var prev: Node?

        init(key: Int, val: Int) {
            self.key = key
            self.val = val
        }
    }

    private var dummyHead: Node = .init(key: 0, val: 0)
    private var dummyTail: Node = .init(key: 0, val: 0)

    init() {
        dummyHead.next = dummyTail
        dummyTail.prev = dummyHead
    }

    func addLast(node: Node) {
        node.prev = dummyTail.prev
        node.next = dummyTail

        dummyTail.prev?.next = node
        dummyTail.prev = node
    }

    func remove(node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    func removeFirst() -> Node? {
        if dummyHead.next === dummyTail { return nil }
        if let first = dummyHead.next {
            remove(node: first)
            return first
        }

        return nil
    }
}

private class LRUCache {
    private var container: [Int: DoubleList.Node] = [:]

    private let capacity: Int

    private var cache: DoubleList = .init()

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    private func makeRecently(key: Int) {
        if let node = container[key] {
            cache.remove(node: node)
            cache.addLast(node: node)
        }
    }

    func addRecently(key: Int, val: Int) {
        let node = DoubleList.Node(key: key, val: val)
        cache.addLast(node: node)
        container[key] = node
    }

    func deleteKey(key: Int) {
        guard let node = container[key] else { return }
        cache.remove(node: node)
        container.removeValue(forKey: key)
    }

    func removeLeastRecently() {
        if let node = cache.removeFirst() {
            container.removeValue(forKey: node.key)
        }
    }

    func get(_ key: Int) -> Int {
        var res = -1
        if let node = container[key] {
            res = node.val
            makeRecently(key: key)
        }
        return res
    }

    func put(_ key: Int, _ value: Int) {
        if let node = container[key] {
            node.val = value
            makeRecently(key: key)
        }

        addRecently(key: key, val: value)

        if container.count > capacity {
            removeLeastRecently()
        }
    }
}

class TestSolution0146: XCTestCase {
    func test1() {
        let lruCache = LRUCache(2)
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        XCTAssertEqual(lruCache.get(1), 1)
        lruCache.put(3, 3)
        XCTAssertEqual(lruCache.get(2), -1)
        lruCache.put(4, 4)
        XCTAssertEqual(lruCache.get(1), -1)
        XCTAssertEqual(lruCache.get(3), 3)
        XCTAssertEqual(lruCache.get(4), 4)
    }
}
