//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

// MARK: - Pre Order
/// 递归解法
func preOrderRecursive(root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []

    res.append(root.val)
    res += preOrderRecursive(root: root.left)
    res += preOrderRecursive(root: root.right)

    return res
}

/// 迭代解法
func preOrderTraverse1(root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []
    var stack = [root]
    var cur = root

    while let last = stack.popLast() {
        cur = last
        res.append(cur.val)

        if let right = cur.right {
            stack.append(right)
        }

        if let left = cur.left {
            stack.append(left)
        }
    }

    return res
}

/// 迭代解法2
func preOrderTraverse2(root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = [root.val]
    var stack: [BinaryTreeNode<Int>] = [root]

    while let last = stack.last {
        if let left = last.left, !res.contains(left.val) {
            stack.append(left)
            res.append(left.val)
            continue
        }

        if let right = last.right, !res.contains(right.val) {
            stack.append(right)
            res.append(right.val)
            continue
        }

        _ = stack.popLast()
    }

    return res
}

// MARK: - In Order
/// 递归解法
func inOrderRecursive(root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []

    res += inOrderRecursive(root: root.left)
    res.append(root.val)
    res += inOrderRecursive(root: root.right)

    return res
}

/// 迭代解法
///
/// 遇到当前节点，不能立刻遍历，而是需要先在栈中保存，然后顺着最左边不断向下，如果无法向下了，就把栈顶元素取出来，访问栈顶元素，然后转向栈顶元素的右子树。
func inOrderTraverse(root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }
    var res: [Int] = []
    var stack: [BinaryTreeNode<Int>] = []
    var cur: BinaryTreeNode<Int>? = root

    while cur != nil || !stack.isEmpty {
        if let _cur = cur {
            stack.append(_cur)
            cur = _cur.left
        } else {
            cur = stack.popLast()!
            res.append(cur!.val)
            cur = cur?.right
        }
    }

    return res
}

// MARK: - Post Order
func postOrderRecursive(root: BinaryTreeNode<Int>?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []

    res += postOrderRecursive(root: root.left)
    res += postOrderRecursive(root: root.right)
    res.append(root.val)

    return res
}
