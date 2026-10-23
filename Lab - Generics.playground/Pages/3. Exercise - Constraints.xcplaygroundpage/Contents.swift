/*:
## Exercise - Constraints

 A constraint limits which types can fill in a type parameter. `T: Equatable` means `T` can be any type that can be checked with `==`. `T: Comparable` means `T` can be any type that can be put in order with `<` and `>`.

 This function won't build. Read the error, then add a constraint so it builds. Don't change anything inside the function.
 */
func position<T: Equatable>(of target: T, in items: [T]) -> Int? {
    for index in 0..<items.count {
        if items[index] == target {
            return index
        }
    }
    return nil
}

struct Ticket: Equatable {
    let row: String
    let seat: Int
}



//:  Create one `[String]` and one `[Int]`. For each array, call `position(of:in:)` once with a value that is in the array and once with a value that isn't, so four calls in all. Print each result, using `??` to print `-1` when the value isn't found.
let names = ["Alice", "Bob", "Charlie"]
let numbers = [10, 20, 30]

print(position(of: "Bob", in: names) ?? -1)
print(position(of: "David", in: names) ?? -1)

print(position(of: 20, in: numbers) ?? -1)
print(position(of: 50, in: numbers) ?? -1)




//:  Here is a struct for a concert ticket. Make `Ticket` conform to `Equatable`. Then create a `[Ticket]` with three tickets, and use `position(of:in:)` to find one of them. Print the result.


//struct Ticket {
  //  let row: String
  //  let seat: Int
//}


//:  Remove `: Equatable` from `Ticket` and read the error on your `position(of:in:)` call. Put `: Equatable` back. In a comment, explain what the error was telling you.

    // Answer: The error means Ticket doesn't follow the Equatable protocol.
    // The position function needs Equatable so it can compare values
    // using ==. Adding Equatable back fixes the error.



//:  Write a generic function called `isBetween(_:low:high:)` that returns a `Bool`. It returns `true` when the first argument is greater than or equal to `low` and less than or equal to `high`. The first argument has no label, and all three arguments are the same type `T`. Add the constraint `T` needs. Call it with three `Int` values and with three `String` values, and print each result. (Strings are compared in alphabetical order, so `"m"` is between `"a"` and `"z"`.)


    func isBetween<T: Comparable>(_ value: T, low: T, high: T) -> Bool {
        return value >= low && value <= high
    }

    print(isBetween(5, low: 1, high: 10))
    print(isBetween("m", low: "a", high: "z"))


//:  Call `isBetween(_:low:high:)` with three `Bool` values. Read the error, then delete that line. In a comment, explain why `Bool` can't be used here but `String` can.

// Answer: Bool can't be used because it only follows Equatable,
// not Comparable. String follows Comparable, so Swift can
// compare strings using <, >, <=, and >=.


/*:
 [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Where Clauses](@next)
 */
