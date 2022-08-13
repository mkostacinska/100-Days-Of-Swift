import UIKit

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agentName: String { get set }
    
    func printSummary() -> Void
}

extension Building {
    func printSummary() {
        print("This is a building with \(self.rooms) rooms, that comes at a lovely cost \(self.cost). For more information contact \(self.agentName)!")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSummary() {
        print("Hi i'm \(self.agentName) buy this for \(self.cost) it also has \(self.rooms)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    //do not need to implement the printSummary as we have provided a default via extension
}
