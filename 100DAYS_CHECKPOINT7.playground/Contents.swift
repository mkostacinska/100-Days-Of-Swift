import UIKit

class Animal {
    let legs : Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog : Animal {
    func speak() {
        print("general dog woofie")
    }
}

class Cat : Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("cat meow")
    }
}

class Corgi : Dog {
    override func speak() {
        print("corgi woofie")
    }
}

class Poodle : Dog {
    override func speak() {
        print("poodly doodly woofie")
    }
}

class Persian : Cat {
    override func speak() {
        print("persian meow")
    }
}

class Lion : Cat {
    override func speak() {
        print("lion meow")
    }
}

