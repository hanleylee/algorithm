//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

func bubbleSort<T>(_ array: inout [T], _ sortType: (T, T) -> Bool) -> [T] {
    for i in 0 ..< array.count {
        for j in 1 ..< array.count - i {
            if sortType(array[j], array[j - 1]) {
                array.swapAt(j, j - 1)
            }
        }
    }

    return array
}
