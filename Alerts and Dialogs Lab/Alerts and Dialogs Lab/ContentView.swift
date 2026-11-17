//
//  ContentView.swift
//  Alerts and Dialogs Lab
//
//  Created by Cortney Anderson on 11/11/26.
//


import SwiftUI

// Error types for requirement 3
enum AppError: LocalizedError {
    case invalidNumber
    case connectionFailed

    var errorDescription: String? {
        switch self {
        case .invalidNumber:
            return "The number is invalid. Please try again."
        case .connectionFailed:
            return "Connection failed. Please try again later."
        }
    }
}

// Function that can throw two different errors
func checkNumber(_ number: Int) throws {
    if number < 0 {
        throw AppError.invalidNumber
    } else if number == 0 {
        throw AppError.connectionFailed
    }
}

// Data for requirement 4
struct FoodItem {
    let name: String
    let price: Int
}

struct ContentView: View {

    // Alert 1
    @State private var showDeleteAlert = false
    @State private var itemDeleted = false

    // Alert 2
    @State private var showNameAlert = false
    @State private var typedName = ""
    @State private var savedName = "None"

    // Alert 3
    @State private var showErrorAlert = false
    @State private var errorMessage = ""

    // Alert 4
    @State private var selectedItem: FoodItem?
    @State private var showItemAlert = false

    let foodItems = [
        FoodItem(name: "Pizza", price: 12),
        FoodItem(name: "Burger", price: 9),
        FoodItem(name: "Tacos", price: 8)
    ]

    // Dialog 5
    @State private var showResetDialog = false
    @State private var resetMessage = "Not reset"

    // Dialog 6
    @State private var showColorDialog = false
    @State private var selectedColor = "None"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    // 1. Alert with roles
                    Text("1. Alert with Roles")
                        .font(.headline)

                    Text(itemDeleted ? "Item deleted" : "Item exists")

                    Button("Delete Item") {
                        showDeleteAlert = true
                    }
                    .alert("Delete Item?", isPresented: $showDeleteAlert) {
                        Button("Delete", role: .destructive) {
                            itemDeleted = true
                        }

                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Are you sure you want to delete this item?")
                    }

                    Divider()

                    // 2. Alert with TextField
                    Text("2. Alert with Text Field")
                        .font(.headline)

                    Text("Saved Name: \(savedName)")

                    Button("Enter Your Name") {
                        typedName = ""
                        showNameAlert = true
                    }
                    .alert("Enter Name", isPresented: $showNameAlert) {
                        TextField("Your name", text: $typedName)

                        Button("Save") {
                            savedName = typedName
                        }

                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Type your name and press Save.")
                    }

                    Divider()

                    // 3. Error Alert
                    Text("3. Error Alert")
                        .font(.headline)

                    Button("Test Invalid Number") {
                        testError(-1)
                    }

                    Button("Test Connection Error") {
                        testError(0)
                    }
                    .alert("Error", isPresented: $showErrorAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(errorMessage)
                    }

                    Divider()

                    // 4. Alert with Data
                    Text("4. Alert with Data")
                        .font(.headline)

                    VStack(spacing: 10) {
                        ForEach(foodItems, id: \.name) { item in
                            Button(item.name) {
                                selectedItem = item
                                showItemAlert = true
                            }
                        }
                    }
                    .alert(
                        "Food Details",
                        isPresented: $showItemAlert,
                        presenting: selectedItem
                    ) { item in
                        Button("OK") { }
                    } message: { item in
                        Text("\(item.name) costs $\(item.price).")
                    }

                    Divider()

                    // 5. Confirmation Dialog
                    Text("5. Confirmation Dialog")
                        .font(.headline)

                    Text(resetMessage)

                    Button("Reset Progress") {
                        showResetDialog = true
                    }
                    .confirmationDialog(
                        "Reset Progress?",
                        isPresented: $showResetDialog,
                        titleVisibility: .visible
                    ) {
                        Button("Reset", role: .destructive) {
                            resetMessage = "Progress was reset"
                        }

                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("This will reset your progress.")
                    }

                    Divider()

                    // 6. Dialog with Choices
                    Text("6. Dialog with Choices")
                        .font(.headline)

                    Text("Selected Color: \(selectedColor)")

                    Button("Choose a Color") {
                        showColorDialog = true
                    }
                    .confirmationDialog(
                        "Choose a Color",
                        isPresented: $showColorDialog,
                        titleVisibility: .visible
                    ) {
                        Button("Red") {
                            selectedColor = "Red"
                        }

                        Button("Blue") {
                            selectedColor = "Blue"
                        }

                        Button("Green") {
                            selectedColor = "Green"
                        }

                        Button("Cancel", role: .cancel) { }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Alerts and Dialogs")
        }
    }

    // Calls the throwing function using do, try, catch
    func testError(_ number: Int) {
        do {
            try checkNumber(number)
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }
}

#Preview {
    ContentView()
}
