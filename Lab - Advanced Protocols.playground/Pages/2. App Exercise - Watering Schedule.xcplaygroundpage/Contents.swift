/*:
## App Exercise - Watering Schedule

 >These exercises reinforce Swift concepts in the context of a plant care app.

 Every plant in the app will conform to one protocol.

 Write a protocol called `Plant` with three requirements: a property called `name` of type `String` that can be read, a property called `daysBetweenWatering` of type `Int` that can be read, and a method called `careTip()` that returns a `String`.
 */
protocol Plant {
    var name: String { get }
    var daysBetweenWatering: Int { get }
    func careTip() -> String
}




//:  Write a struct called `Fern` that conforms to `Plant`. Ferns need water every 3 days, and the care tip should say to keep the fern out of direct sun. The fern's `name` should be set when you create one, like `Fern(name: "Kitchen Fern")`.
struct Fern: Plant {
    var name: String
    let daysBetweenWatering = 3

    func careTip() -> String {
        return "Keep the fern out of direct sun."
    }
}




//:  Write a struct called `Cactus` that conforms to `Plant`. A cactus needs water every 14 days, and the care tip should say to let the soil dry out completely. Its `name` should also be set when you create one.
struct Cactus: Plant {
    var name: String
    let daysBetweenWatering = 14

    func careTip() -> String {
        return "Let the soil dry out completely."
    }
}




//:  Write a function called `printWateringSchedule(for:)` that takes a `[Plant]`. For each plant, print one line with its name, how many days apart to water it, and its care tip.

func printWateringSchedule(for plants: [any Plant]) {
    for plant in plants {
        print("\(plant.name): Water every \(plant.daysBetweenWatering) days. \(plant.careTip())")
    }
}



//:  Create a variable called `myGarden` of type `[Plant]` that holds at least one `Fern` and one `Cactus`. Give each plant its own name. Pass `myGarden` to `printWateringSchedule(for:)` and observe the printout.

var myGarden: [any Plant] = [
    Fern(name: "Kitchen Fern"),
    Cactus(name: "Living Room Cactus")
]

printWateringSchedule(for: myGarden)



//:  The user just bought a basil plant. Write a struct called `Basil` that conforms to `Plant`. Basil needs water every day, so `daysBetweenWatering` is 1. Its care tip should tell the user to pick leaves from the top. Do not change `printWateringSchedule(for:)`.

struct Basil: Plant {
    var name: String
    let daysBetweenWatering = 1

    func careTip() -> String {
        return "Pick leaves from the top."
    }
}



//:  Append a `Basil` to `myGarden`. Call `printWateringSchedule(for:)` again and observe the printout.


myGarden.append(Basil(name: "Kitchen Basil"))

printWateringSchedule(for: myGarden)


//:  Write a function called `plantsNeedingWater(in:daysSinceWatering:)`. It takes a `[Plant]` and an `Int`, and it returns a `[Plant]`. A plant needs water when `daysSinceWatering` is greater than or equal to its `daysBetweenWatering`. Call it with `myGarden` and `3`, then print the name of each plant it returns. You should see the fern and the basil, but not the cactus.


func plantsNeedingWater(in plants: [any Plant], daysSinceWatering: Int) -> [any Plant] {
    var needsWater: [any Plant] = []

    for plant in plants {
        if daysSinceWatering >= plant.daysBetweenWatering {
            needsWater.append(plant)
        }
    }

    return needsWater
}

let thirstyPlants = plantsNeedingWater(in: myGarden, daysSinceWatering: 3)

for plant in thirstyPlants {
    print(plant.name)
}


//:  `printWateringSchedule(for:)` was written before `Basil` existed, but it printed your basil plant without any changes. In a comment, explain why.


// Answer: Because Basil follows the Plant protocol, it has all the
// same required properties and methods. The function works with
// any plant that follows the protocol, so we don't need to change it.


/*:
 [Previous](@previous)  |  page 2 of 8  |  [Next: Exercise - Default Implementations](@next)
 */
