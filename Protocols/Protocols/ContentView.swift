//
//  ContentView.swift
//  Protocols
//
//  Created by Cortney Anderson on 9/15/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//1.1
// a. Has to have a battery percent
// b. asking is it pulug in ? t/f
// c. the a function to see if its plugged in to the charger

// The bool statement could be a let becasue we will never change the value

//1.2
// isPluggedIn is a let constant, but the Chargeable protocol requires it to be var

// ElectricScooter is missing the plugIn() function required by Chargeable.

//1.3
// can() needs to return a String.
// ParkingPass is missing : Scannable.
