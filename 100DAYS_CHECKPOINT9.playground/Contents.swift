import UIKit

func randomElement(array: [Int]?) -> Int {
    return (array?.randomElement()) ?? Int.random(in: 1...100)
}

