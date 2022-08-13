import UIKit

//the concept of swift protocols is like that of interfaces in java - they allow us to create a 'skeleton' for a data type
//for example
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
} //ensures that any subtype of vehicle MUST implement those two functions
//creating classes that conform to the protocol is calles ADOPTING or CONFORMING the protocol

//for example, this train class conforms to the vehicle
class Train: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance/100
    }
    
    func travel(distance: Int) {
        print("choo choo")
    }
    
    //here we can further implement more functions specific to the train itself
}

//now, if we create a function like this:
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

//we can use it on any vehicle type, as all vahicles myst implement the travel function. thus:
let train = Train()
commute(distance: 100, using: train)
//this allows us to create broader functions that can allow multiple types as parameters at the same time

//as well as methods, you can have protocols describe properties
protocol Animal {
    var name: String {get} //its only readable
    var currentMood: String {get set}
    func makeSound() -> String
}

//one class can conform to many protocols
//if we have a superclass and a protocol, the notation is
// class Name: SuperClass, Protocol

// MARK: -

//swift provides something called opaque return types, which allows us to simplify our code
//returning a protocol from a function lets us hide the type that were returning and focus on the functionality that were returning
//in order to be able to return the protocol type from these functions, we need the some keyword. This is because returning just equatable would hide too much information from the compiler - it wouldnt know whether two returned values are comparable
func getRandomNumber() -> some Equatable { //this allows swift to get the actual type that is being returned without losing the benefits of returning a protocol
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// returning Vehicle means "any sort of Vehicle type but we don't know what", whereas returning some Vehicle means "a specific sort of Vehicle type but we don't want to say which one.”

//this is directly used when in swiftUI we return 'some View'

// MARK: -

//we can write our own extensions to the already provided code to simplify our code, e.g.
extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    } //adding a new property
    
    
    //adding some new functions
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
}
var s1 = "     I forgot    "

//now, instead of writing
s1.trimmingCharacters(in: .whitespacesAndNewlines)
//we can just as well write
s1.trimmed()

//we can also directly mutate the string without having to return a new value (that usually demands a new variable)
s1.trim() //permanently changes the string so that now its whitespace trimmed

//you can also add extensions that define properties on a class, but they can only be computed properties (as above)
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
lyrics.lines.count //number of lines in a lyric

//this means we can now have more than one initializer for a class - adding the other ones has to simply be done by creating a custom initializer (have a var either be passed or computed automatically)


//we can also write extensions to protocols: we can extend a protocol to add method implementations so that all the classes adopting a protocol get those methods as well
// for example:
extension Array {
    var isNotEmpty: Bool { //simple extension that allows us to use .isNotEmpty instead of !.isEmpty
        isEmpty == false
    }
}

//but we can do better - this is so that isNotEmpty can be applied to arrays, dictionaries, and sets, who all conform to Collection
extension Collection { //collection is a protocol
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

//we can also generally create protocols, and provide default implementations of the required methods via extension (protocol-oriented programming), e.g.:
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

//now any conforming types can add their own sayHello if they want to, but they do not need to

// MARK: -
extension Int { //simple extension on int allowing us to have the squared number computed
    func squared() -> Int {
        self * self
    }
}

// we can also just simply do the extension on Numeric, so that its applicable to both int and double values
extension Numeric {
    func squared() -> Self { //returns the same type as it originally is
        self * self
    }
}

// MARK: -
struct User: Equatable, Comparable {
    //make user conform to equatable
    let name: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
