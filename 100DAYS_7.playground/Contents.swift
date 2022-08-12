import UIKit

// things classes and structs have in common:
// 1: they are yours to define

// the differences:
// 1: there is no inheritance for structs
// 2: you always need your own initializer for classes
// 3: copies of the same class instance share memory space (the variable is a memo pointer)
// 4: when the final instance of a class is destroyed, swift can run a deinitializer
// 5: even if a class is constant, you can still change its mutable properties (vars)

//inheritance in class signature is same as python
// when overriding a method, you must use the override kwrd

//if a child class has any custom initializers, it must always call the parents initializer AFTER finishing setting up the additional ones
//example:
class Vehicle { //the parent class
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle { //the subclass
    var isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

//in swift, all copies of a particular instance share memory space, e.g.:
var car1 = Car(isElectric: true, isConvertible: true)
var car2 = car1
car2.isConvertible = false
print(car1.isConvertible) //prints false despite the change being on class 1

//if you want a unique copy of an instance, you need a copy() method that generates a new instance and copies current data to reflect the wanted instance at a certain moment

//swift classes can optionally be given a deinitializer, which is called when an instance is destroyed and its memory space is to be freed:
//we never call deiniializers ourselves, they get called by the system automatically

//for example:
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit { //they dont have parentheses - they cant take parameters
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

//same as in java, the variables corresponding to class instances are actually just pointers to the memory allocated (hence why the nature of the copying)

