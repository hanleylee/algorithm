//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/8/1.
//

import Foundation

public class LeetcodeNode {
    public var val: Int
    public var children: [LeetcodeNode]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
