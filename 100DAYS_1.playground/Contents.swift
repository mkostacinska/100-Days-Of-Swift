import UIKit

var greeting = "Hello, playground"

//constants in swift are created with the let kword
let constant1 = true
//camel case convention

//you can use emojis inside strings
//breaking the string works the same as in python - \
//multi line strings are same as python - """
let result = """
             ⭐️ You win! ⭐️
             """

//string length
let stringlen = result.count

//uppercase
let uppercase = result.uppercased()

//prefix or suffix
let prefix = result.hasPrefix("Boob") //false
let suffix = result.hasSuffix("Nose") //false

//you can use undercolons to break up numbers however you want
let million = 1_000_000 //1,000,000

//shorthand operators
var number = 10
number += 5 //15
number -= 10 //5
number *= 2 //10
number /= 2 //5

//to find out if a number is a multiple of another number, use
number.isMultiple(of: 5) //true

//you cant (by default) add integers to decimals - you need to convert them first
let double_conversion = 2.0 + Double(3)
let integer_conversion = 1 + Int(2.0)

//toggling booleans - switching the value from true to false
var some_bool = false
some_bool.toggle() //true
some_bool.toggle() //false

//string interpolation
let name = "Tom"
let quality = "stinky"
let truth = "\(name) is \(quality)"
