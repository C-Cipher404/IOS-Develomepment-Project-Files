//
//  ContentView.swift
//  PickersLab
//
//  Created by Cortney Anderson on 9/14/26.
//

import SwiftUI

struct Park: Hashable {
    var name: String
    var yearBecameNationalPark: Int
    var acres: Int
    var closestTown: String
    
    var yearsAsNationalPark: Int {
        2026 - yearBecameNationalPark
    }
}

struct ContentView: View {
    
    static let zion = Park(
    name: "Zion",
    yearBecameNationalPark: 1900,
    acres: 150000,
    closestTown: "St. Geroge"
        )
    
    static let bryceCanyon = Park(
        name: "Bryce Canyon",
        yearBecameNationalPark: 1900,
        acres: 50000,
        closestTown: "Bryce Canyon City"
    )
    
    static let arches = Park(
        name: "Arches",
        yearBecameNationalPark: 1900,
        acres: 80000,
        closestTown: "Moab"
        )
    static let capitolReef = Park (
        name: "Capitol Reef",
        yearBecameNationalPark: 1900,
        acres: 250000,
        closestTown: "Torrey"
        )
    
    @State private var selectedPark = ContentView.zion
    
    var body: some View {
        VStack(spacing: 20) {
            Picker ("Park", selection: $selectedPark){
                
                Text(ContentView.zion.name)
                    .tag(ContentView.zion)
                
                Text(ContentView.bryceCanyon.name)
                    .tag(ContentView.bryceCanyon)
                
                Text(ContentView.arches.name)
                    .tag(ContentView.arches)
                
                Text(ContentView.capitolReef.name)
                    .tag(ContentView.capitolReef)
            }
            .pickerStyle(.segmented)
            
            Text("Park: \(selectedPark.name)")
            
            Text("Became a National Park: \(selectedPark.yearBecameNationalPark)")
            
            Text("Acres: \(selectedPark.acres)")
            
            Text("Closest Town: \(selectedPark.closestTown)")
            
            Text("Years as a National Park: \(selectedPark.yearsAsNationalPark)")
        }
        .padding()
    }
    
    }


#Preview {
    ContentView()
}
