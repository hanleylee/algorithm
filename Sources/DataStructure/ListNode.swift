//
//  ListNode.swift
//  LeetCode
//
//  Created by Hanley Lee on 2021/01/03.
//

import Foundation

public class ListNode<T> {
    public var val: T
    public var next: ListNode?
//    public init() { val = 0; next = nil }
    public init(_ val: T) { self.val = val }
    public init(_ val: T, _ next: ListNode?) { self.val = val; self.next = next }
}

public extension ListNode {
    static func create(with arr: [T]) -> ListNode? {
        guard !arr.isEmpty else { return nil }
        let res = ListNode(arr.first!)
        var head: ListNode? = res

        for element in arr {
            let node = ListNode(element)
            head?.next = node
            head = head?.next
        }

        return res.next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node: ListNode? = self
        while let nd = node {
            s += "\(nd.val)"
            node = nd.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}
