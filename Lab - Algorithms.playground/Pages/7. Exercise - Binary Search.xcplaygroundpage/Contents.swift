/*:
## Exercise - Binary Search

 Binary search works like the guessing game. It checks the middle item and throws away the half that can't hold the target. It only works on a sorted array.

 The function below is already written. `low` and `high` mark the part of the array that could still hold the target.
 */


func binarySearch(for targetID: Int, in sortedSongIDs: [Int]) -> Int? {
    var checks = 0
    var low = 0
    var high = sortedSongIDs.count - 1

    while low <= high {
        let middle = (low + high) / 2
        checks += 1
        // Add the low, middle and high print here
        print("low: \(low), middle: \(middle), high: \(high)")

        if sortedSongIDs[middle] == targetID {
            print("Found song \(targetID) after \(checks) checks")
            return middle
        } else if sortedSongIDs[middle] < targetID {
            low = middle + 1
        } else {
            high = middle - 1
        }
    }
    print("Song \(targetID) not found after \(checks) checks")
    return nil
}

let smallLibrary = Array(1...10)
let mediumLibrary = Array(1...100)
let largeLibrary = Array(1...1000)


//:  On the line that says `// Add the low, middle and high print here`, add `print("low: \(low), middle: \(middle), high: \(high)")`. This shows you how the search area shrinks each round.





//:  Before you run the call below, predict how many checks it takes to find song 700 in `largeLibrary`. Write your prediction in a comment. After you run it, look at the low, middle and high lines in the console. In a comment, describe what happens to the distance between `low` and `high` each round.

// Prediction: 9 checks

_ = binarySearch(for: 700, in: largeLibrary)

// The distance between low and high gets about half as small each round.
// Binary search keeps throwing away half of the remaining search area.



//:  Add three lines below that search for song 0 in `smallLibrary`, `mediumLibrary` and `largeLibrary`. Then fill in the table. Copy your worst-case numbers for linear search from the previous page.

_ = binarySearch(for: 0, in: smallLibrary)
_ = binarySearch(for: 0, in: mediumLibrary)
_ = binarySearch(for: 0, in: largeLibrary)

/*
 Library size | Linear search worst case | Binary search worst case
 10           | 10                       | 3
 100          | 100                      | 6
 1,000        | 1,000                    | 9
 */

//:  The array below is not sorted. Song 3 is in it. Predict in a comment whether `binarySearch` will find it. Then run the call and explain what happened.

// Prediction:
// No, binarySearch will probably not find 3 because the array is not sorted.

let unsortedSongIDs = [42, 7, 93, 15, 68, 3, 81, 29, 56, 10]

_ = binarySearch(for: 3, in: unsortedSongIDs)

// What happened:
// It did not find 3 even though 3 is in the array.
// Binary search only works correctly on sorted arrays because it decides
// which half to throw away based on whether the middle value is too high or too low.

//:  In a comment, explain what O(log n) means, using your table as the example.

// O(log n) means the number of checks grows slowly as the input gets bigger.
// In our table, binary search took about 3 checks for 10 items,
// 6 checks for 100 items, and 9 checks for 1,000 items.
// Even though the library got much bigger, the number of checks only increased a little
// because binary search cuts the remaining search area in half each round.



/*:
 [Previous](@previous)  |  page 7 of 12  |  [Next: Exercise - Set vs Array Lookup](@next)
 */
