import UIKit

struct Person {
    var name: String
    var age: Int
}

let peopleInLine = [Person(name: "Cortney", age: 29), Person(name: "Ryker", age: 17)]

var temperatrueReadingsThisWeek = [ 21.1, 30,25.5,70,95]

temperatrueReadingsThisWeek.append(15)

var subsitiutionCypher = ["Z", "Y", "X", "W"]

var mcDonaldsMenu = ["55 burgers", "55 fries", "55 shakes", "155 tater tots"]

var myFavoriteMovies = ["Matrix", "Princess Bride", "Nightmare on Elm Street"]

struct Contact {
    var firstName: String
    var middleName: String?
    var lastName: String?
    
    var socialSecurityNumber: Int?
    
}

var parker = Contact(firstName: "Parker")
print(parker.lastName)

parker.lastName = "Rushton"
print(parker.lastName)

parker.lastName = nil

print(parker.lastName)

struct Book {
    var title: String
    var pages: Int?
    var reviews: [Int] = [1,2,3]
}
var bookOne = Book(title: "Harry Potter")
print(bookOne.pages)
print(bookOne.title)


