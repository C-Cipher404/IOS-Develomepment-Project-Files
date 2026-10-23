/*:
## Exercise - Linear Search

 Linear search checks each item in order until it finds a match or runs out of items.

 The function below is already written. It counts its checks, but it does not print them yet.
 */


let songTitles = ["Late Bus Home", "Coffee at Noon", "Static Summer", "Paper Lanterns", "Back Porch Blues", "Rooftop Radio", "Slow Motion Sunday", "City of Glass"]

//func linearSearch(for targetTitle: String, in titles: [String]) -> Int? {
//    var checks = 0
//    for (index, title) in titles.enumerated() {
//        checks += 1
//        if title == targetTitle {
//            // Add the "found" print here
//            return index
//        }
//    }
//    // Add the "not found" print here
//    return nil
//}


//:  Add two lines to `linearSearch`. On the line that says `// Add the "found" print here`, add `print("Found \(targetTitle) after \(checks) checks")`. On the line that says `// Add the "not found" print here`, add `print("\(targetTitle) not found after \(checks) checks")`.
func linearSearch(for targetTitle: String, in titles: [String]) -> Int? {
    var checks = 0

    for (index, title) in titles.enumerated() {
        checks += 1

        if title == targetTitle {
            print("Found \(targetTitle) after \(checks) checks")
            return index
        }
    }

    print("\(targetTitle) not found after \(checks) checks")
    return nil
}




//:  Before you run the calls below, write how many checks each search will take in the comments.
// Prediction for "Late Bus Home": 1 check
// Prediction for "Paper Lanterns": 4 checks
// Prediction for "City of Glass": 8 checks
// Prediction for "Lemon Skies": 8 checks
//:  Each call below starts with `_ =`. That tells Swift you only want the printout, and you are not using the index the function returns.


_ = linearSearch(for: "Late Bus Home", in: songTitles)
_ = linearSearch(for: "Paper Lanterns", in: songTitles)
_ = linearSearch(for: "City of Glass", in: songTitles)
_ = linearSearch(for: "Lemon Skies", in: songTitles)


//:  In a comment, answer each question. Which search was the best case? Which searches were the worst case? Why does Big-O describe the worst case?


// Best case: "Late Bus Home" because it was the first item and only took 1 check.

// Worst case: "City of Glass" and "Lemon Skies" because both took 8 checks.
// "City of Glass" was the last item, and "Lemon Skies" was not in the array,
// so the search had to check every item.

// Big-O usually describes the worst case because it shows the maximum amount
// of work the algorithm may need as the input gets larger.


//:  `linearSearch` returns `Int?` and not `Int`. In a comment, explain why.

// linearSearch returns Int? because the song might not be found.
// If it finds the song, it returns the index as an Int.
// If it does not find the song, it returns nil.



/*:
 [Previous](@previous)  |  page 5 of 12  |  [Next: App Exercise - Growing Library](@next)
 */
