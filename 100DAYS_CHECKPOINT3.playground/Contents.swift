import UIKit

for i in 1...100 {
    if i.isMultiple(of: 3){
        if i.isMultiple(of: 5)
        {
            print("FizzBuzz")
            continue
        }
        print("Fizz")
        continue
    }
    else if i.isMultiple(of: 5){
        print("Buzz")
        continue
    }
    print(i)
}
