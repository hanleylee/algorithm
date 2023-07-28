@testable import CSAlgorithm
import XCTest

final class breadFirstSearchTest: XCTestCase {
    func test1() {
        let graph = Graph()

        let nodeA = graph.addNode("a")
        let nodeB = graph.addNode("b")
        let nodeC = graph.addNode("c")
        let nodeD = graph.addNode("d")
        let nodeE = graph.addNode("e")
        let nodeF = graph.addNode("f")
        let nodeG = graph.addNode("g")
        let nodeH = graph.addNode("h")

        graph.addEdge(nodeA, neighbor: nodeB)
        graph.addEdge(nodeA, neighbor: nodeC)
        graph.addEdge(nodeB, neighbor: nodeD)
        graph.addEdge(nodeB, neighbor: nodeE)
        graph.addEdge(nodeC, neighbor: nodeF)
        graph.addEdge(nodeC, neighbor: nodeG)
        graph.addEdge(nodeE, neighbor: nodeH)
        graph.addEdge(nodeE, neighbor: nodeF)
        graph.addEdge(nodeF, neighbor: nodeG)

        let nodesExplored = breadthFirstSearch(graph, source: nodeA)
        print(nodesExplored)
    }

    func test2() {}
}
