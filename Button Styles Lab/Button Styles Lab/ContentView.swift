//
//  ContentView.swift
//  Button Styles Lab
//
//  Created by Cortney Anderson on 11/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isSelected = false

    var body: some View {
        VStack(spacing: 25) {

            Button("Chunky Button") {
                print("Chunky button tapped")
            }
            .buttonStyle(.chunky())

            Button("Brown Chunky Button") {
                print("Brown button tapped")
            }
            .buttonStyle(.chunky(color: .brown))

            Button("Delete", role: .destructive) {
                print("Delete tapped")
            }
            .buttonStyle(.chunky(color: .blue))

            Button {
                print("Plus tapped")
            } label: {
                Image(systemName: "plus")
            }
            .buttonStyle(.circleIcon)

            Button("Large") {
                isSelected.toggle()
            }
            .buttonStyle(.chip(isSelected: isSelected))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
