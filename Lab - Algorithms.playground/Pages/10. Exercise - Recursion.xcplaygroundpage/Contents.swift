/*:
## Exercise - Recursion

 A recursive function calls itself on a smaller piece of the problem. The base case is the part that stops the calls. Each call waits on the stack until the call it made finishes.
 */


func countdownToRelease(from secondsLeft: Int) {
    if secondsLeft == 0 {
        print("New album out now!")
        return
    }
    print("\(secondsLeft)...")
    countdownToRelease(from: secondsLeft - 1)
    // Add the "finished" print here
    print("Finished \(secondsLeft)")
}


//:  In a comment, write which lines are the base case. Then predict what `countdownToRelease(from: 3)` will print.

// Base case:
// if secondsLeft == 0 {
//     print("New album out now!")
//     return
// }

// Prediction:
// 3...
// 2...
// 1...
// New album out now!
// Finished 1
// Finished 2
// Finished 3

//:  Call `countdownToRelease(from: 3)` and observe the printout.

func countdownToRelease1(from secondsLeft: Int) {
    if secondsLeft == 0 {
        print("New album out now!")
        return
    }

    print("\(secondsLeft)...")

    countdownToRelease(from: secondsLeft - 1)

    print("Finished the call for \(secondsLeft)")
}

// Prediction:
// 3...
// 2...
// 1...
// New album out now!
// Finished the call for 1
// Finished the call for 2
// Finished the call for 3

countdownToRelease(from: 3)

// The calls finish in the opposite order because each call waits
// for the recursive call inside it to finish first.
// The most recent call finishes first, then it works back through the stack.


//:  On the line that says `// Add the "finished" print here`, add `print("Finished the call for \(secondsLeft)")`. Before you run it again, predict the order the new lines will print in. Then run it. In a comment, explain why the calls finish in the opposite order they started.

// Prediction:
// Finished the call for 1
// Finished the call for 2
// Finished the call for 3

// The calls finish in the opposite order because each recursive call
// has to wait for the next call to finish first.
// Once the base case is reached, the calls finish from the most recent
// call back to the first call.

//:  A song gets 1 play on day 1, 2 plays on day 2, 3 plays on day 3, and so on. The function below adds up all the plays through a given day.


func totalPlays(throughDay dayNumber: Int) -> Int {
    if dayNumber == 0 {
        return 0
    }
    return dayNumber + totalPlays(throughDay: dayNumber - 1)
}


//:  Predict what `totalPlays(throughDay: 4)` returns, and how many times `totalPlays` gets called in all. Then print the result and check.
// Prediction for the result: 10
// Prediction for the number of calls: 5

//:  Do not run this one. In a comment, explain what would happen if you called `totalPlays(throughDay: -1)`, and why. Use the words base case and stack in your answer.

// Calling totalPlays(throughDay: -1) would never reach the base case,
// because the number would keep getting smaller: -1, -2, -3, and so on.
// The function would keep adding more recursive calls to the stack
// until the program eventually crashes from too many calls.



/*:
 [Previous](@previous)  |  page 10 of 12  |  [Next: Exercise - Sorting Algorithms](@next)
 */
