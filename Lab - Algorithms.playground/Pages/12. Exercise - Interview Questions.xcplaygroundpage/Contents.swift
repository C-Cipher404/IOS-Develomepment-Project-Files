/*:
## Exercise - Interview Questions

 Interviewers for iOS jobs often ask about algorithms, searching and sorting. Answer each question in a comment, the way you would answer it out loud in an interview. Write in your own words, 2 to 4 sentences each. Use an example from this playground where it helps.
 */

// Big-O describes how the amount of work an algorithm does grows as
// the amount of data gets bigger. For example, linear search is O(n)
// because in the worst case it may have to check every item in the array.



//:  1. What does Big-O describe, and why do we usually talk about the worst case?

// Answer:
// Big-O describes how the amount of work an algorithm does grows as the input gets bigger.
// We usually talk about the worst case because it shows the most work the algorithm might have to do.


//:  2. Walk me through how binary search works. When can't you use it?

// Answer:
// Binary search looks at the middle item first and compares it to what you are searching for.
// It then throws away half of the list and keeps repeating until it finds the item or runs out of places to look.
// You can only use binary search when the data is already sorted.


//:  3. Your code passed every test with 20 songs, but it is slow in production with 50,000 songs. What might be going on, and how would you find out?

// Answer:
// The code may be using an algorithm that works fine with a small list but gets much slower as the list grows.
// I would check its Big-O, count how many steps it takes with 50,000 songs, and use performance tools to see which part is taking the most time.


//:  4. Why is merge sort faster than bubble sort on a large list?

// Answer:
// Merge sort is faster on large lists because it keeps splitting the list into smaller halves before sorting them.
// Bubble sort compares lots of neighboring items over and over, so it does much more work as the list gets bigger.
// Merge sort is O(n log n), while bubble sort is O(n²).


//:  5. How would you check an array for duplicates? Now how would you make it faster?

// Answer:
// I could compare each item to the other items in the array to see if any values match.
// That works, but it can be slow because it may use nested loops.
// To make it faster, I would use a Set to keep track of values I have already seen.
// If the Set already contains the value, then I know there is a duplicate.


//:  6. What is recursion, and what happens if a recursive function has no base case?

// Answer:
// Recursion is when a function calls itself to solve a smaller version of the same problem.
// A base case tells the function when to stop calling itself.
// Without a base case, the calls keep getting added to the stack until the program eventually crashes.


//:  7. Why would you use Swift's built-in `sort()` in an app instead of writing your own sort?


// Answer:
// I would use Swift's built-in sort because it is already tested, optimized, and easier to read.
// It also saves time and is less likely to have bugs than writing my own sorting algorithm.
// I would only write my own sort if I was learning how sorting works or had a very specific need.

/*:
 [Previous](@previous)  |  page 12 of 12
 */
