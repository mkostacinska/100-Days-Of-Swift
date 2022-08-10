import UIKit

//declaring an array
var array1 = ["first", "string", "array"]
let array2 = [1, 2, 3]

//as in other languages, reading from an array is by index:
array1[0]

//modifying an array
array1.append("Something")

//declaring an array can also be done by initialising an empty one:
var array3 = Array<Int>() //empty new int array
var array4 = [Int]() //shortcut
array3.append(1)
array3.append(3)
array3.count //length of array
array3.remove(at: 1) //removing at given index
array3.removeAll() //removing all entries

//check if an array contains an element
array3.contains(1)
array1.sorted() //sorted array (alphabetically for strings)
//sorted also exists for strings
array1.reversed() //reversed array


let person = [
    "name": "Tommy",
    "age": "20",
    "partner": "maja"
]
//we can now read from the dictionary - we can provide a default in case the key does not exist
print(person["name", default: "Maja"])

//creating an empty dictionary
var dict1 = [String: Int]()


//sets are like arrays but without duplicate items, and the order does not matter
var love = Set(["Tom", "Bozon", "Babcia"]) //<-- you can create a set from any array
love.insert("SleepApp")
//IMPORTANT: .contains() on a set runs much faster than on an array


enum Weekday {
    case monday
    case tuesday
    case thursday
    case friday
    case saturday
    case sunday
}

//or, alternatively
enum WeekdayShort {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var day = Weekday.monday
day = Weekday.friday
day = .thursday //we dont have to type in the enum name every time


//type annotations in swift look like this
let score: Int = 0
var cities: [String] = []
//or with type interference
var citiesType: [String] = [String]()




