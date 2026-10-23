//
//  StudyGuideData.swift
//  Course3StudyGuide
//
//  Created by Cortney Anderson on 10/22/26.
//

import Foundation

let studyTopics: [Topic] = [

    Topic(
        title: "Hardware",
        icon: "desktopcomputer",
        summary: "Hardware is all of the physical parts that make a computer work. Each part has its own job, but they all work together.",
        questions: [
            QuestionAnswer(
                question: "What are the main parts of a computer, and what does each one do?",
                answer: "The main parts are the CPU, RAM, storage, and input and output devices. The CPU processes instructions, RAM holds things the computer is using right now, storage saves files long term, and input/output devices let us interact with the computer."
            ),
            QuestionAnswer(
                question: "What's the difference between memory and storage?",
                answer: "RAM is temporary memory that holds things while the computer is running. Storage keeps things like apps, photos, and files even after the computer is turned off."
            ),
            QuestionAnswer(
                question: "Why do computers use binary?",
                answer: "Computers use binary because their hardware can easily represent two states, on and off. We write those states as 1 and 0."
            )
        ],
        example: "I think of RAM like my desk and storage like a filing cabinet. Stuff on my desk is what I am using right now, while the filing cabinet keeps things for later."
    ),

    Topic(
        title: "Memory",
        icon: "memorychip",
        summary: "Memory is how a program keeps track of information while it is running. Swift uses things like the stack, heap, and ARC to manage that memory.",
        questions: [
            QuestionAnswer(
                question: "What are the stack and the heap, and what goes in each?",
                answer: "The stack is fast memory that usually holds local variables and value types like structs. The heap is used for things that need to stay around longer, like class instances."
            ),
            QuestionAnswer(
                question: "What happens when you copy a struct vs. copy a class?",
                answer: "When you copy a struct, you get a separate copy of its values. When you copy a class, both variables usually point to the same object."
            ),
            QuestionAnswer(
                question: "How does ARC decide when to free a class instance?",
                answer: "ARC keeps track of how many strong references point to a class object. When there are no strong references left, Swift can remove that object from memory."
            )
        ],
        example: "If I copy a struct for a player score and change one copy, the other one stays the same. With a class, both variables can point to the same player object."
    ),

    Topic(
        title: "Algorithms and Big-O",
        icon: "magnifyingglass",
        summary: "An algorithm is a set of steps used to solve a problem. Big-O helps describe how the amount of work changes when the amount of data gets bigger.",
        questions: [
            QuestionAnswer(
                question: "What is an algorithm, and what does Big-O describe?",
                answer: "An algorithm is a set of steps that solves a problem. Big-O describes how fast or slow that algorithm grows as it has more data to work with."
            ),
            QuestionAnswer(
                question: "How do linear search and binary search work, and what's the Big-O of each?",
                answer: "Linear search checks items one at a time until it finds what it wants, so it is O(n). Binary search keeps cutting a sorted list in half, so it is O(log n)."
            ),
            QuestionAnswer(
                question: "Why is looking something up in a Set or Dictionary faster than searching an array?",
                answer: "A Set or Dictionary can usually jump close to the value it needs instead of checking every item one by one. Their lookup is usually O(1), while searching an array is usually O(n)."
            )
        ],
        example: "Looking for a name in an unsorted list is like checking every name one at a time. Binary search is more like opening a phone book near the middle and cutting the search area in half each time."
    ),

    Topic(
        title: "Systems Architecture",
        icon: "gearshape",
        summary: "Systems architecture is about how the different layers of a computer work together. The operating system helps connect apps to the hardware underneath.",
        questions: [
            QuestionAnswer(
                question: "What does an operating system do?",
                answer: "The operating system manages things like memory, files, hardware, and running apps. It basically helps the software and hardware communicate with each other."
            ),
            QuestionAnswer(
                question: "What's the difference between a program, a process and a thread?",
                answer: "A program is the code saved on the computer. A process is that program while it is running, and a thread is one path of work happening inside the process."
            ),
            QuestionAnswer(
                question: "Why does UI work have to happen on the main thread?",
                answer: "The main thread handles what the user sees and interacts with. UI updates need to happen there so the screen stays organized and does not get updated by multiple things at the same time."
            )
        ],
        example: "I think of a process like a restaurant and threads like the workers inside it. They can work on different jobs, but the person handling the front counter needs to keep things organized."
    ),

    Topic(
        title: "The Internet",
        icon: "globe",
        summary: "The internet lets devices send information back and forth. Apps usually request data from a server and then use the response to update what the user sees.",
        questions: [
            QuestionAnswer(
                question: "What happens when an app asks a server for data?",
                answer: "The app sends a request over the internet to a server. The server processes the request and sends a response back with the data or an error."
            ),
            QuestionAnswer(
                question: "What do IP addresses and DNS do?",
                answer: "An IP address is like the address of a device on a network. DNS turns names like apple.com into the IP address the computer needs to connect to."
            ),
            QuestionAnswer(
                question: "What is an API, and what does HTTPS add to HTTP?",
                answer: "An API is a set of rules that lets programs communicate with each other. HTTPS is HTTP with encryption added, which helps protect the information being sent."
            )
        ],
        example: "A weather app can send a request to a weather API for today's forecast. The server sends the weather data back, and the app displays it on the screen."
    ),

    Topic(
        title: "SOLID",
        icon: "checkmark.seal",
        summary: "SOLID is a group of five ideas that help keep code organized and easier to change. They are useful when an app starts getting bigger and more complicated.",
        questions: [
            QuestionAnswer(
                question: "What does each letter in SOLID stand for?",
                answer: "S is Single Responsibility, O is Open/Closed, L is Liskov Substitution, I is Interface Segregation, and D is Dependency Inversion."
            ),
            QuestionAnswer(
                question: "Why do these principles make code easier to change?",
                answer: "They help keep different jobs separated and keep code from depending too much on one specific thing. That makes it easier to change one part without breaking everything else."
            ),
            QuestionAnswer(
                question: "What does one of the principles look like in Swift code?",
                answer: "Dependency Inversion can use a protocol so a type depends on the protocol instead of one specific class or struct. Then we can swap in different types that follow the same protocol."
            )
        ],
        example: """
protocol Notifier {
    func notify()
}

struct TextNotifier: Notifier {
    func notify() {
        print("Sending text")
    }
}
"""
    )
]
