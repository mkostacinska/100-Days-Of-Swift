import UIKit

//you can declare new data types in swift
struct ExampleClass { //standard notation has structs start with uppercase
    //MARK: PROPERTIES:
    let constantInstance: Int //non mutable
    var instancevar: String //instance variables
    
    //MARK: INITIALIZER - SYNTATIC SUGAR
    //apparently you dont need an explicit initializer and Swift does it for you,
    //upon creating the instance just make sure to specify the values for all the properties (unless default specified)
    //MARK: METHODS
    func classMethod() -> Void {
        //some method
    }
    
    //any function that changes the data inside a struct has to be preceded with the mutating kwrd
    //we cannot call mutating functions on contant instances of the struct
    mutating func changeInstance(newInstance : String) -> Void {
        instancevar = newInstance
    }
}


//MARK: -
// structs can have two types of a property:
// 1. stored properties that are variables or constants holding data inside a struct
// 2. computed properties that are computed dynamically every time the property is accessed
// for example

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

//MARK: -
// we can create property observers which run when a specific property changes
// these can take two forms: didSet which runs when a property has just chages and willSet which run just before a property changes

struct Tom {
    var smelly: Bool = true {
        didSet {
            let truth = smelly ? "" : "not "
            print("Tom is \(truth)smelly.")
        }
        
        willSet {
            if newValue {
                print("Tom is becoming really smelly!")
            } else {
                print("Tom just showered!")
            }
        }
    }
}

var tim = Tom()
tim.smelly.toggle()
sleep(3)
tim.smelly.toggle()

//MARK: -
// you can overwrite initializers as long as every property will have a value by the end of initializer execution
struct Player {
    let name: String
    let number: Int
}

let p1 = Player(name: "Tom", number: 0) //memberwise initializer - the properties are assigned their values in the order of definition

struct Player2 {
    let name: String
    let number: Int

    //no func kwrd
    init(name: String) { //no explicit return type
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

//MARK: -
// access modifiers in swift:
// private: only accessible from within the class
// - private(set): public read, private set
// fileprivate: only accessible from within the file (protected)
// public: public

//you can use Self (camel self) to change some static var/refer to the class instead of the instance










