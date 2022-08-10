import UIKit

//if statements in swift work the same as in python
var score = 80
if score<85 {
    print("true")
}

//for strings, comparisons work alphabetically
//to check if a string is empty, we use
var string = ""
string.isEmpty //true

//logical operators: and - &&, or - ||

//switch statements
enum mood {
    case happy, sad, upset, angry
}

var majaMood = mood.happy

switch majaMood {
case .happy:
    print("maja is happy")
    fallthrough //falthrough is used to continue executing cases
case .angry:
    print("maja is angry")
case .sad:
    print("maja is sad")
case .upset:
    print("maja is upset")
//default:
    //print("not found") <-- default needs always to be last
}

//switch statements must be exhaustive. Executes up to the first matching condition. You can provide a default case for when the matching case is not found

//ternary conditional operator can be used for oneliner if statements
let age = 25
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)
//mnemonic: WTF - What? True : False

//loops in swift also work quite similar to python
let things = ["smelly", "lovely", "mad", "poopy"]
for thing in things {
    print("tom is \(thing)")
}

//looping over a fixed number
for i in 0...3 { //INCLUSIVE!
    //EXCLUSIVE: for i in 0..<3
    print(i)
}

//while loops have the same exact syntax as in python
//so do continue and break clauses - continue skips current iteration, break skips all remaining iterations

