import UIKit

enum intSqrtError : Error {
    case outOufRange, noRoot
}


func intSqrt(for number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw intSqrtError.outOufRange
    }
    
    //as the sqrt of 10,000 is 100, we only need to consider the first 100 integers
    for i in 1...100 {
        if i*i == number {
            return i
        }
    }
    
    throw intSqrtError.noRoot
}

do {
    print(try intSqrt(for: 1))
    print(try intSqrt(for: 0))
} catch intSqrtError.outOufRange {
    print("The number provided is out of specified range (1 - 10,000).")
} catch intSqrtError.noRoot {
    print("The number provided has no integer root.")
} catch {
    print("An unexpected error has occured.")
}
