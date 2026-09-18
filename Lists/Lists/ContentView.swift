//
//  ContentView.swift
//  Lists
//
//  Created by Cortney Anderson on 9/16/26.
//

import SwiftUI

struct Game: Identifiable {
    let id = UUID()
    var title: String
    var genre: String
    var installed: Bool
}

struct ContentView: View {

    @State private var games: [Game] = [
        Game(title: "Luigi's Mansion", genre: "Adventure", installed: true),
        Game(title: "Fortnite", genre: "Battle Royale", installed: false),
        Game(title: "Grand Theft Auto", genre: "Action", installed: true),
        Game(title: "The Legend of Zelda: Majora's Mask", genre: "Adventure", installed: true),
        Game(title: "Call of Duty: Black Ops Zombies", genre: "Shooter", installed: false),
        Game(title: "Kirby", genre: "Platformer", installed: true),
        Game(title: "Mario Kart", genre: "Racing", installed: false),
        Game(title: "Animal Crossing", genre: "Simulation", installed: true)
    ]

    @State private var filterSelection = "All"

    let filterOptions = ["All", "Installed", "Uninstalled"]

    var filteredGames: [Game] {
        switch filterSelection {
        case "Installed":
            return games.filter { $0.installed }

        case "Uninstalled":
            return games.filter { !$0.installed }

        default:
            return games
        }
    }

    var body: some View {

        VStack {

            Picker("Filter", selection: $filterSelection) {
                ForEach(filterOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            List {
                ForEach(filteredGames) { game in

                    VStack(alignment: .leading) {
                        Text(game.title)
                            .font(.headline)

                        Text(game.genre)

                        Text(game.installed ? "Installed" : "Not Installed")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
