//
//  File.swift
//
//
//  Created by Hanley Lee on 2023/7/12.
//

import Foundation

func breadthFirstSearch(_: Graph, source: Node) -> [String] {
    var queue = Queue<Node>()
    queue.enqueue(source)

    var nodesExplored = [source.label]
    source.visited = true

    while let node = queue.dequeue() {
        for edge in node.neighbors {
            let neighborNode = edge.neighbor
            if !neighborNode.visited {
                queue.enqueue(neighborNode)
                neighborNode.visited = true
                nodesExplored.append(neighborNode.label)
            }
        }
    }

    return nodesExplored
}
