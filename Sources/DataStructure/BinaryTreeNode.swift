//
//  BinaryTreeNode.swift
//
//
//  Created by BiaoWu on 16/8/23.
//
//

import Foundation

public class BinaryTreeNode<T: Comparable> {
    public var val: T

    public var left: BinaryTreeNode<T>?
    public var right: BinaryTreeNode<T>?

    public init(_ value: T) {
        self.val = value
    }
}

public extension BinaryTreeNode {
    func left(value: T) -> BinaryTreeNode<T> {
        return left(node: BinaryTreeNode(value))
    }

    func left(node: BinaryTreeNode<T>) -> BinaryTreeNode<T> {
        left = node
        return self
    }

    func right(value: T) -> BinaryTreeNode<T> {
        return right(node: BinaryTreeNode(value))
    }

    func right(node: BinaryTreeNode<T>) -> BinaryTreeNode<T> {
        right = node
        return self
    }

    func search(_ value: T) -> BinaryTreeNode? {
        if value == val {
            return self
        }

        if let found = left?.search(value) {
            return found
        }

        if let found = right?.search(value) {
            return found
        }

        return nil
    }
}
