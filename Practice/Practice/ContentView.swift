//
//  ContentView.swift
//  Practice
//
//  Created by Cortney Anderson on 10/27/26.
//

import SwiftUI
import Observation

@Observable
class Playlist {
    var songs: [String] = [
        "Rooftop Radio",
        "Coffee at Noon",
        "Static Summer"
    ]
}

struct ContentView: View {
    @State private var playlist = Playlist()

    var body: some View {
        VStack {
            List(playlist.songs, id: \.self) { song in
                Text(song)
            }

            Button("Add Song") {
                playlist.songs.append("Late Bus Home")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
