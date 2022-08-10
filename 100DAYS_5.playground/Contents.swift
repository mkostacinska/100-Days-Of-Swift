import UIKit

//you can save copies of functions under variables as you would normally do in python.
//you can also define functions shorthand (if its just a executable lines with no parameters), e.g.
let greeting = {
    print("Hi there!")
} //closure expression
greeting()

//closure expressions can also accept parameters:
let namedGreeting = { (name: String) -> String in //in is used to mark the end of parameters/return type
    return "Hi, \(name)!"
}

//function type annotations:
var greetingFunc: () -> Void = {} //with provided default value
var greetingParam: (String) -> Void = { _ in } //with provided parameter types

//an example of a function that allows us to pass in a function as a parameter is sorted() for arrays - we can pass in our own sorting algorithm.
//the function to be passed must accept two strings and return true if the first one is to be before the second
var array = ["Samantha", "Joe", "Mark", "Dan", "Suzie", "Anathema"]
//simple function sorting elements length-wise
func sorting (s1: String, s2: String) -> Bool {
    if s1.count > s2.count{
        return false
    }
    return true
}

let sortedArray = array.sorted(by: sorting)
//we can also explicitly write in the new sorting function into the .sorted call by using a closure expression

//trailing closures and shorthand syntax:
//suppose this is your (overwrited) new sorting algo:
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)

//with trailing closure syntax, we can simplify it as follows
let captainFirstTeam2 = team.sorted {// name1, name2 in //no type annotation as its forced by .sorted
    if $0 == "Suzanne" { //can refer to the passed values by $0 (like environment variables)
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
} //not in .sorted call (not as a parameter), instead just a trailing closure after the call

//on order to pass functions as parameters, we need type annotations (to be able to use closure notation)
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
//now, to make the array we can use shorthand notation
var rolls = makeArray(size: 5) {
    Int.random(in: 1...20)
}
print(array)

