//
//  ContentView.swift
//  IOSInClassNotes
//
//  Created by Cortney Anderson on 9/11/26.
//

import SwiftUI

struct ContentView: View {
    @State var students = ["Raiden",
                           "Averie",
                           "Fariz",
                           "Ray",
                           "Nate",
                           "Joey",
                           "Michael",
                           "Max",
                           "Cortney",
                           "Ryker",
                           "Ethan"]
    @State var selectedStudent = "Press the button below to call a student"

    func callRandomName() -> String {
        let random = students.randomElement() ?? "All done!"

        students.removeAll { $0 == random }

        return random
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack{
                Text("Press the button below to call a student")
                    .font(.system(size: 50))
                    .padding()
                    .padding()
                    .hidden()
                
                Text(selectedStudent)
                    .foregroundStyle(.blue)
                    .font(.system(size: 50))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.thickMaterial)
                    }
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.cyan)
                    }
            
            }
            Spacer()

            Button("Random Student") {
                let student = callRandomName()
                selectedStudent = student
            }
            .buttonStyle(.borderedProminent)
            .disabled(students.isEmpty)
            .strikethrough(students.isEmpty)
            .bold()

            Button("Reset") {
                students = ["Raiden",
                            "Averie",
                            "Fariz",
                            "Ray",
                            "Nate",
                            "Joey",
                            "Michael",
                            "Max",
                            "Cortney",
                            "Ryker",
                            "Ethan"]
                
                selectedStudent = "Press the button below to call a student"
                
                @State var selectedDogName = ""
                var body: some View {
                VStack{
                   Text(
                        Picker ("Cool Dog Name", selection: $selectedDogName){
                            Text("Shredder").tag("shredder")
                            Text("Cupcake").tag("cupcake")
                            Text("Alan Liebowitz").tag("alan liebowitz")
                            Text("Commander Beefsweat").tag("commander beefsweat")
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
