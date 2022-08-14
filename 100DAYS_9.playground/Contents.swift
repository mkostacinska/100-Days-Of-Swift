import UIKit

//swift ensures correct data typing with optionals. One very simple example of optionals is:
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite: String? = opposites["Peach"] //there will be no value as peach is not a key in the dictionary
//we signal the optional by putting a question mark after the data type
//String? means the value is either a String or nil (no value)

//we need to unwrap optionals before use, so that swift can know whether or not there is actually anything for us to use
//one example of doing that is with
if let marioOpposite = opposites["Mario"] { //if let
    print("Mario's opposite is \(marioOpposite)")
}
//generally, the structure is if let someVar = optional {} - if the oprional has a value, we proceed inside the loop

//unwrapping optionals with guard looks like this
func printSquare(of number: Int?) {
    guard let number = number else { //if no value, do something
        print("Missing input")
        return //guard always requires an early return statement
    }

    print("\(number) x \(number) is \(number * number)")
}
//if let acts when there is value, guard let acts when there is none

//unwrapping optionals with nil coalescing
//nil coalescing lets us unwrap the optional and provide a default if its empty:
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A" //?? is the nil coalescing operator

//optional chaining is syntax for reading optionals inside optionals
let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")
//this essentially means: if the optional has a value inside, proceed, else do the nil coalescing
//the return value of an optional chain is always an optional, which is why we need coalescing

//we can use an optional try (try?) and have a function return an optional by the end of execution, for example
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) { //optional try
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous" //optional try with nil coalescing - needs brackets
print(user)



