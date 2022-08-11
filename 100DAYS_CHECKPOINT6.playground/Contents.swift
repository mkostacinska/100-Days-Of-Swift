import UIKit

struct Car {
    public let model: String
    public let seatsNumber: Int
    private var gear: Int
    
    init(model: String, seatsNumber: Int, gear: Int) {
        self.model = model
        self.seatsNumber = seatsNumber
        self.gear = gear
    }
    
    mutating func changeGear(amount: Int) -> Void {
        if gear == 10 {
            print("maximum gear reached")
        }
        else if gear == 1 {
            print("minimum gear reached")
        } else {
            if gear + amount >= 10 || gear + amount <= 1 {
                print("you cant change the gear by that much")
            } else {
                gear += amount
            }
        }
    }
}
