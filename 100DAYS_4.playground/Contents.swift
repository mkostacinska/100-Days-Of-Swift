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

//to return multiple values at once, we can use an array

