public class Node: Equatable {
    public var neighbors: [Edge]

    public private(set) var label: String
    public var distance: Int?
    public var visited: Bool

    public init(_ label: String) {
        self.label = label
        neighbors = []
        visited = false
    }

    public var hasDistance: Bool {
        return distance != nil
    }

    public func remove(_ edge: Edge) {
        neighbors.remove(at: neighbors.firstIndex { $0 === edge }!)
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        if let distance = distance {
            return "Node(label: \(label), distance: \(distance))"
        }
        return "Node(label: \(label), distance: infinity)"
    }
}

public func == (_ lhs: Node, rhs: Node) -> Bool {
    return lhs.label == rhs.label && lhs.neighbors == rhs.neighbors
}
