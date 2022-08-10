import UIKit

//function syntax in swift
func usualBehavior() {
    print("nothing unusual found")
}

//parameter passing
func printNumber(number: Int){
    print("the number you gave me was \(number)")
}

printNumber(number: 3)
printNumber(number: 4)

//return statemets work same as in python
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
//additionally, if the function has a return type specified and is a one liner, swift knows that the one line must be the return statement and we can skip the return kwrd, like so
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

//to return multiple values at once, we can use a tuple
//in swift, tuples can have named indexes, as:
var tuple1 = (firstname: "Maja", secondname: "K")
tuple1.firstname //Maja
tuple1.secondname //K

//if youre returning tuples from a function with return value specified, swift already knows the tuple names, as so
func getUser() -> (firstname: String, friend: Bool) {
    ("Tom", true)
}
var friend = getUser()
friend.firstname
friend.friend
//alternatively
var (name, friendshipStatus) = getUser()
name
friendshipStatus

//by default, tuple elements can be accessed by indexes.
//if a certain value is to be ommitted (not considered), we can tell swift to ignore it:
var (name2, _) = getUser() //the friendship status will be ignored


//in Swift, you can have multiple functions of the same name as long as the named parameter values differ - this is enough for swift to figure out which function to call
//in documentation, such functions will be referred to as (e.g.) hireEmployee(name:)
//we can use _ to discard of external parameter labels, for example
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

//another popular parameter label is 'for'. HEre's how to achieve it
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

//we can provide default values for the parameters, like so:
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

//Swift only allows enough memory for arrays as to store its contents and have a little room for additional content (memory opt)
//when removing items from the array, swift automatically frees up the resources
//if you want to keep the initial memory capacity, you can use
var array1 = [1, 2, 3, 4, 5]
array1.removeAll(keepingCapacity: true) //does not free up the resources


//handling errors:
//1. we must identify and specify all possible types of errors. This can be done by defining an enum
enum PasswordError : Error {
    case short, obvious
}

//2. now, we can use them in an applicable function
//such function needs the throws kwrd
func checkPass(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    else if password == "123" {
        throw PasswordError.obvious
    }
    return "Good"
}

//3. Now, in order to handle the caught error:
var password = "123"
do {
    //need to use try before the problematic part
    //you can also use !try if you want to interrupt the execution of code on error occurence
    let result = try checkPass(password)
    print("My password was \(result)!")
} catch PasswordError.short {
    print("An error was thrown - the password was too short")
} catch PasswordError.obvious {
    print("An error was thrown - the password was too obvious")
} catch {
    print("An unexpected error was thrown")
}


