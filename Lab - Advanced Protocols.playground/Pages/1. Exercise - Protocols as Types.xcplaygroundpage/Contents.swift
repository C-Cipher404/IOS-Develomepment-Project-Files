/*:
## Exercise - Protocols as Types

 In Protocols 1 you wrote protocols and made your own types conform to them. Now you'll use a protocol's name as a type. A protocol's name can go anywhere a type name can: the type of a property, the type of a parameter, or the type of an array. Anything that conforms to the protocol fits.

 Write a protocol called `Vehicle` with two requirements: a property called `wheelCount` of type `Int` that can be read, and a method called `describe()` that returns a `String`.
 */

protocol Vehicle {
    var wheelCount: Int { get }
    func describe() -> String
}



//:  Write two structs that conform to `Vehicle`: `Bicycle`, which has 2 wheels, and `DeliveryTruck`, which has 6. Each one's `describe()` should return a sentence with its number of wheels in it, like "A bicycle with 2 wheels".


struct Bicycle: Vehicle {
    let wheelCount = 2

    func describe() -> String {
        return "A bicycle with \(wheelCount) wheels"
    }
}

struct DeliveryTruck: Vehicle {
    let wheelCount = 6

    func describe() -> String {
        return "A delivery truck with \(wheelCount) wheels"
    }
}



//:  Write a struct called `ParkingSpot` with one property called `parkedVehicle`. Its type should be `Vehicle`.
struct ParkingSpot {
    var parkedVehicle: any Vehicle
}




//:  Create a variable called `cornerSpot` that is a `ParkingSpot` holding a `Bicycle`. Print `cornerSpot.parkedVehicle.describe()`. Then put a `DeliveryTruck` in `cornerSpot.parkedVehicle` and print it again. Observe the printout.
var cornerSpot = ParkingSpot(parkedVehicle: Bicycle())

print(cornerSpot.parkedVehicle.describe())

cornerSpot.parkedVehicle = DeliveryTruck()

print(cornerSpot.parkedVehicle.describe())




//:  Write a function called `printTollCost(for:)` that takes one `Vehicle` argument. The toll is $2 per wheel. Print a line like "Toll for a vehicle with 2 wheels: $4". Call the function once with a `Bicycle` and once with a `DeliveryTruck`, and observe the printout.

func printTollCost(for vehicle: any Vehicle) {
    let toll = vehicle.wheelCount * 2
    print("Toll for a vehicle with \(vehicle.wheelCount) wheels: $\(toll)")
}

printTollCost(for: Bicycle())
printTollCost(for: DeliveryTruck())



//:  Create a constant called `parkingLot` of type `[Vehicle]` that holds two bicycles and one delivery truck. Use a `for`-`in` loop to print `describe()` for every vehicle in the lot.

let parkingLot: [any Vehicle] = [
    Bicycle(),
    Bicycle(),
    DeliveryTruck()
]

for vehicle in parkingLot {
    print(vehicle.describe())
}



//:  Use a second `for`-`in` loop to add up the `wheelCount` of every vehicle in `parkingLot`. Print the total. It should be 10.

var totalWheels = 0

for vehicle in parkingLot {
    totalWheels += vehicle.wheelCount
}

print("Total wheels: \(totalWheels)")



//:  Try adding the number `4` to the array in `parkingLot`. Read the error, then take the `4` back out. In a comment, explain what the error is telling you.

// Answer: The error means that Int does not conform to the Vehicle protocol.
//The array can only hold types that follow Vehicle, like Bicycle and DeliveryTruck.


/*:
 page 1 of 8  |  [Next: App Exercise - Watering Schedule](@next)
 */
