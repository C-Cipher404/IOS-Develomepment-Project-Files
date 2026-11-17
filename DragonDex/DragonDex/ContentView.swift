//
//  ContentView.swift
//  DragonDex
//
//  Created by Cortney Anderson on 11/11/26.
//


import SwiftUI

// MAIN TAB VIEW
struct MainTabView: View {

    @State private var mainRouter = MainRouter()
    @State private var dragonsRouter = DragonsRouter()

    var body: some View {
        TabView(selection: $mainRouter.selectedTab) {

            // Dragons Tab
            DragonListScreen()
                .environment(dragonsRouter)
                .tabItem {
                    Label("Dragons", systemImage: "flame.fill")
                }
                .tag(MainRouter.Tab.dragons)

            // Riders Tab
            RidersScreen()
                .tabItem {
                    Label("Riders", systemImage: "person.2.fill")
                }
                .tag(MainRouter.Tab.riders)
        }
        .environment(mainRouter)
        .sheet(isPresented: $mainRouter.isShowingSettings) {
            SettingsScreen()
                .environment(mainRouter)
        }
    }
}

// DRAGON LIST SCREEN
struct DragonListScreen: View {

    @Environment(DragonsRouter.self) private var router
    @Environment(MainRouter.self) private var mainRouter

    var body: some View {
        @Bindable var router = router

        NavigationStack(path: $router.navigationPath) {
            List {
                ForEach(dragons, id: \.self) { dragon in
                    Button {
                        router.navigateTo(route: .dragon(dragon))
                    } label: {
                        HStack {
                            Text(dragon.name)
                                .foregroundStyle(.primary)

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("DragonDex")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {

                    // Random Dragon
                    Button("Random Dragon") {
                        if let randomDragon = dragons.randomElement() {
                            router.navigateTo(route: .dragon(randomDragon))
                        }
                    }

                    // Settings
                    Button {
                        mainRouter.isShowingSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .navigationDestination(for: DragonsRouter.Route.self) { route in
                router.view(for: route)
            }
        }
    }
}

// DRAGON DETAIL SCREEN
struct DragonDetailScreen: View {

    let dragon: Dragon

    @Environment(DragonsRouter.self) private var router

    var body: some View {
        List {
            Section("Dragon Information") {
                Text("Name: \(dragon.name)")
                Text("Species: \(dragon.species)")
                Text("Fire Rating: \(dragon.fireRating)")
                Text("Lore: \(dragon.lore)")
            }

            Section("Special Powers") {
                ForEach(dragon.powers, id: \.self) { power in
                    Button {
                        router.navigateTo(route: .power(power))
                    } label: {
                        HStack {
                            Text(power.name)
                                .foregroundStyle(.primary)

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle(dragon.name)
    }
}

// POWER DETAIL SCREEN
struct PowerDetailScreen: View {

    let power: Power

    @Environment(DragonsRouter.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Text(power.name)
                .font(.largeTitle)
                .bold()

            Text(power.description)
                .multilineTextAlignment(.center)

            Button("Back to Dragons") {
                router.goHome()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Power Details")
    }
}

// RIDERS SCREEN
struct RidersScreen: View {

    @Environment(MainRouter.self) private var mainRouter

    var body: some View {
        NavigationStack {
            List {
                ForEach(riders, id: \.self) { rider in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(rider.name)
                                .font(.headline)

                            Text("Dragon: \(rider.dragonName)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Button("Find Dragon") {
                            mainRouter.selectedTab = .dragons
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
            .navigationTitle("Riders")
        }
    }
}

// SETTINGS SCREEN
struct SettingsScreen: View {

    @Environment(MainRouter.self) private var mainRouter

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "gearshape.fill")
                    .font(.largeTitle)

                Text("DragonDex Settings")
                    .font(.title)
                    .bold()

                Text("Manage your DragonDex preferences here.")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .navigationTitle("Settings")
            .toolbar {
                Button("Done") {
                    mainRouter.isShowingSettings = false
                }
            }
        }
    }
}

// CONTENT VIEW
struct ContentView: View {
    var body: some View {
        MainTabView()
    }
}

#Preview {
    ContentView()
}
