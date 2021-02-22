//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SwiftGraph

let cityGraph: WeightedGraph<String, Int> = WeightedGraph<String, Int>(vertices: ["Seattle", "San Francisco", "Los Angeles", "Denver", "Kansas City", "Chicago", "Boston", "New York", "Atlanta", "Miami", "Dallas", "Houston"])

cityGraph.addEdge(from: "Seattle", to:"Chicago", weight:2097)
cityGraph.addEdge(from: "Seattle", to:"Chicago", weight:2097)
cityGraph.addEdge(from: "Seattle", to: "Denver", weight:1331)
cityGraph.addEdge(from: "Seattle", to: "San Francisco", weight:807)
cityGraph.addEdge(from: "San Francisco", to: "Denver", weight:1267)
cityGraph.addEdge(from: "San Francisco", to: "Los Angeles", weight:381)
cityGraph.addEdge(from: "Los Angeles", to: "Denver", weight:1015)
cityGraph.addEdge(from: "Los Angeles", to: "Kansas City", weight:1663)
cityGraph.addEdge(from: "Los Angeles", to: "Dallas", weight:1435)
cityGraph.addEdge(from: "Denver", to: "Chicago", weight:1003)
cityGraph.addEdge(from: "Denver", to: "Kansas City", weight:599)
cityGraph.addEdge(from: "Kansas City", to: "Chicago", weight:533)
cityGraph.addEdge(from: "Kansas City", to: "New York", weight:1260)
cityGraph.addEdge(from: "Kansas City", to: "Atlanta", weight:864)
cityGraph.addEdge(from: "Kansas City", to: "Dallas", weight:496)
cityGraph.addEdge(from: "Chicago", to: "Boston", weight:983)
cityGraph.addEdge(from: "Chicago", to: "New York", weight:787)
cityGraph.addEdge(from: "Boston", to: "New York", weight:214)
cityGraph.addEdge(from: "Atlanta", to: "New York", weight:888)
cityGraph.addEdge(from: "Atlanta", to: "Dallas", weight:781)
cityGraph.addEdge(from: "Atlanta", to: "Houston", weight:810)
cityGraph.addEdge(from: "Atlanta", to: "Miami", weight:661)
cityGraph.addEdge(from: "Houston", to: "Miami", weight:1187)
cityGraph.addEdge(from: "Houston", to: "Dallas", weight:239)

let (distances, pathDict) = cityGraph.dijkstra(root: "New York", startDistance: 0)
var nameDistance: [String: Int?] = distanceArrayToVertexDict(distances: distances, graph: cityGraph)
// shortest distance from New York to San Francisco
let temp = nameDistance["San Francisco"]
// path between New York and San Francisco
let path: [WeightedEdge<Int>] = pathDictToPath(from: cityGraph.indexOfVertex("New York")!, to: cityGraph.indexOfVertex("San Francisco")!, pathDict: pathDict)
let stops: [String] = cityGraph.edgesToVertices(edges: path)
let mst = cityGraph.mst()
let cycles = cityGraph.detectCycles()
let isADAG = cityGraph.isDAG
let result = cityGraph.findAllDfs(from: "New York") { (W) -> Bool in
    return true
}
for v in cityGraph {  // g is a Graph<String>
    print(v)
}


