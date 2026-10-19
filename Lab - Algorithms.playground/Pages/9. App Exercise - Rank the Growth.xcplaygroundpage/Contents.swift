/*:
## App Exercise - Rank the Growth

 >These exercises reinforce Swift concepts in the context of a music streaming app.

 Each function below does one job in the app and returns the number of steps it took. They are in no particular order.
 */


let librarySize = 10
let songIDs = Array(1...librarySize)

// Makes every possible two-song mix from the library
func mixEveryPair(from songIDs: [Int]) -> Int {
    var steps = 0
    for firstID in songIDs {
        for secondID in songIDs {
            if firstID != secondID {
                // A real app would build the mix here
            }
            steps += 1
        }
    }
    return steps
}

// Shows the song at the top of the queue
func showNowPlaying(in songIDs: [Int]) -> Int {
    var steps = 0
    print("Now playing song \(songIDs[0])")
    steps += 1
    return steps
}

// Adds up the minutes in the library, if every song is 3 minutes
func addUpListeningTime(for songIDs: [Int]) -> Int {
    var steps = 0
    var totalMinutes = 0
    for _ in songIDs {
        totalMinutes += 3
        steps += 1
    }
    print("Total listening time: \(totalMinutes) minutes")
    return steps
}

// Finds the last song in the library with binary search
func findLastSong(in songIDs: [Int]) -> Int {
    var steps = 0
    let targetID = songIDs[songIDs.count - 1]
    var low = 0
    var high = songIDs.count - 1
    while low <= high {
        let middle = (low + high) / 2
        steps += 1
        if songIDs[middle] == targetID {
            return steps
        } else if songIDs[middle] < targetID {
            low = middle + 1
        } else {
            high = middle - 1
        }
    }
    return steps
}


//:  Before you run anything, rank the four functions in a comment from slowest-growing to fastest-growing. Write the Big-O next to each one.
// Slowest-growing:
// showNowPlaying - O(1)
// findLastSong - O(log n)
// addUpListeningTime - O(n)
// mixEveryPair - O(n²)
// Fastest-growing:


//:  Run the prints below and fill in the "Steps at 10" column. Then change `librarySize` at the top of the page to `100`, run the page again, and fill in the "Steps at 100" column.


print("mixEveryPair: \(mixEveryPair(from: songIDs)) steps")
print("showNowPlaying: \(showNowPlaying(in: songIDs)) steps")
print("addUpListeningTime: \(addUpListeningTime(for: songIDs)) steps")
print("findLastSong: \(findLastSong(in: songIDs)) steps")

/*
 Function           | Steps at 10 | Steps at 100
 mixEveryPair       | 100         | 10000
 showNowPlaying     | 1           | 1
 addUpListeningTime | 10          | 100
 findLastSong       | 4           | 7
 */


//:  In a comment, answer each question. Did your ranking hold up? If not, which one surprised you and why?


// Yes, my ranking held up.
// showNowPlaying grew the slowest, then findLastSong,
// then addUpListeningTime, and mixEveryPair grew the fastest.

// The one that surprised me most was findLastSong because
// the library got 10 times bigger, but the steps only went
// from 4 to 7 because binary search cuts the search area in half.


//:  The app is about to grow to 1,000,000 songs. Which function would you rewrite first? In a comment, explain your choice using Big-O.

// I would rewrite mixEveryPair first because it is O(n²).
// With 1,000,000 songs, the amount of work would grow extremely fast
// because it compares every song with every other song.
// The other functions grow much more slowly: O(1), O(log n), or O(n).



/*:
 [Previous](@previous)  |  page 9 of 12  |  [Next: Exercise - Recursion](@next)
 */
