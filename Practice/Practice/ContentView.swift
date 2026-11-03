//
//  ContentView.swift
//  Practice
//
//  Created by Cortney Anderson on 10/27/26.
//

import SwiftUI

struct ContentView: View {
    let movies = [
        "The Princess Bride",
        "Star Wars",
        "School of Rock",
        "Dune",
        "Nightmare before Christmas"
    ]

    var body: some View {
        NavigationStack {
            List(movies, id: \.self) { movie in
                Text(movie)
            }
            .navigationTitle("Movies We LOVE")
        }
    }
}

#Preview {
    ContentView()
}
