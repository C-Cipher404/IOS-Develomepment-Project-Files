import UIKit

let cities = ["Lehi", "Orem", "Provo", "Draper"]

var cityNamesWithLessThanSixCharacters = cities.filter { $0.count < 6}

let stepCounts = [4200, 9800, 12000, 7600]

let steps = stepCounts.map { $0 + 500}

let days = stepCounts.filter { $0 >= 8000}

let total = stepCounts.reduce(into: 0) {$0 += $1}


import SwiftUI

struct Trailhead: Identifiable {
    let id: ObjectIdentifier
    
    var Id: Int
    var name: String
}
struct ContentView: View {
    let trailHeads = [
        Trailhead(id: 1, name: "Battle Creek"),
        Trailhead(id: 2, name: "Diamond Fork"),
        Trailhead(id: 3, name: "Rattlesanke"),
        Trailhead(id: 4, name: "Twin Lake")
    ]
    
    var body: some View {
        List {
            ForEach(trailHeads){
                trailhead in
                Text(trailhead.name)
            }
        }
    }
}
