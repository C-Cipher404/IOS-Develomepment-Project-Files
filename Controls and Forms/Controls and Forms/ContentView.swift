import SwiftUI

struct ContentView: View {

    let consultationDates = [
        "Tuesday, October 6",
        "Wednesday, October 7",
        "Thursday, October 8",
        "Friday, October 9",
        "Saturday, October 10"
    ]

    @State private var clientName = ""
    @State private var desiredLook = ""
    @State private var selectedDate = "Tuesday, October 6"
    @State private var outfitCount = 1
    @State private var boldness = 0.0
    @State private var wantsTextReminder = false
    @State private var phoneNumber = ""

    var body: some View {

        Form {

            Section("Client") {

                TextField("Name", text: $clientName)

                TextField("What look are you going for?", text: $desiredLook)
            }


            Section("Appointment") {

                Picker("Consultation Date", selection: $selectedDate) {
                    ForEach(consultationDates, id: \.self) { date in
                        Text(date)
                    }
                }

                Stepper("Outfits: \(outfitCount)",
                        value: $outfitCount,
                        in: 1...5)

                Slider(value: $boldness, in: 0...1)

                Text("Boldness: \(boldness)")

                Toggle("Text reminder", isOn: $wantsTextReminder)

                if wantsTextReminder {
                    TextField("Phone Number", text: $phoneNumber)
                }
            }


            Section("Summary") {

                Text("Name: \(clientName)")

                Text("Look: \(desiredLook)")

                Text("Date: \(selectedDate)")

                Text("Outfits: \(outfitCount)")

                Text("Boldness: \(boldness)")

                Text("Reminder: \(wantsTextReminder ? "Yes" : "No")")

                if wantsTextReminder {
                    Text("Phone: \(phoneNumber)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
