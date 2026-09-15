//
//  ContentView.swift
//  LearningProtocols
//
//  Created by Cortney Anderson on 9/15/26.
//

import SwiftUI

protocol Datable {
    var publicationDate: Date? { get set }
}

struct DVD: Datable {
    let publicationDate: Date?
    
    var title: String
    var cast: [String]
}

struct Book: Datable {
    var publicationDate: Date?
    var title: String
    var author: String
}

var media: [Datable] = [Book(title: "Ward D", author: "Frieda Mcfadden")],
DVD(title:"Star Wars Episode II: Attack of the Clones", cast: ["Hayden Christensen", "Natalie Portman"])]

protocol Greetable {
    func greet() -> String
}

struct Dog: Greetable {
    func greet() -> String {
        let random = Int.random(in 1...6 )
        let barksArray = Array(repeating: "woof", count: random)
        
        let string = barksArray.reduce("", +)
        print(string)
    }
}

let dog = Dog()

