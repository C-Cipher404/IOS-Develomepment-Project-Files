import SwiftUI
import Playgrounds

import SwiftUI

struct ContentView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var showingSheet = true

    var body: some View {

        VStack(spacing: 20) {

            Text("Login")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)

            SecureField("Password", text: $password)

            if let errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }

            Button("Login") {

                do {
                    try lookupUsernameAndPassword(
                        email: email,
                        password: password
                    )

                    errorMessage = nil
                    showingSheet = true

                } catch {
                    errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                }
            }
        }
        .padding()
        .sheet(isPresented: $showingSheet) {
            VStack(spacing: 20) {

                Text("Login Successful!")
                    .font(.largeTitle)
                    .bold()

                Button("Close") {
                    showingSheet = false
                }
            }
        }
    }

    func lookupUsernameAndPassword(email: String, password: String) throws {

        if email.isEmpty {
            throw ValidationError.invalidEmail
        }

        if email != "test@email.com" {
            throw ValidationError.userNotFound
        }

        if password != "password" {
            throw ValidationError.incorrectPassword
        }
    }

    enum ValidationError: LocalizedError {

        case userNotFound
        case invalidEmail
        case incorrectPassword

        var errorDescription: String? {

            switch self {

            case .userNotFound:
                return "Sorry, we could not locate that user."

            case .invalidEmail:
                return "Please enter a valid email."

            case .incorrectPassword:
                return "The password is incorrect."
            }
        }
    }
}

#Preview {
    ContentView()
}

