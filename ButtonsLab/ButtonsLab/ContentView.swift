import SwiftUI

struct ContentView: View {

    @State private var name: String = ""
    @State private var backgroundColor: Color = .white
    @State private var buttonDisabled = true
    @State private var message = ""
    @State private var isPink = false

    var body: some View {

        ZStack {
            
            backgroundColor
            
            ScrollView {

                VStack(spacing: 20) {

                    TextField("Please Enter Your Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .background(.blue.opacity(0.5))

                    Button("Submit Name") {
                        print(name)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.mint.opacity(0.5))
                    .foregroundStyle(.black)
                    .clipShape(Capsule())

                    Button("Tap me") {
                        print("Tapped")
                    }
                    .frame(width: 100, height: 100)
                    .background(.purple.opacity(0.5))
                    .foregroundStyle(.black)

                    Button("Don't tap me") {
                        print("You don't listen to instructions")
                    }
                    .frame(width: 150, height: 100)
                    .foregroundStyle(.black)
                    .background(.red.opacity(0.8))
                    .clipShape(Capsule())


                    Button("PUSH ME") {
                        print("Pushed")
                    }
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.black)
                    .background(.orange.opacity(0.8))
                    .clipShape(Circle())

                    Button("Change Background") {
                        isPink.toggle()
                        backgroundColor = isPink ? .pink : .white
                    }
                    .padding()
                    .background(.yellow)
                    .foregroundStyle(.black)
                    .clipShape(Capsule())

                    Button {
                        print("Heart tapped")
                    } label: {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.red)
                    }

                    Button("Enable Button") {
                        buttonDisabled = false
                    }
                    .padding()
                    .background(.blue.opacity(0.5))
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    Button("Sometimes Disabled") {
                        print("I work!")
                    }
                    .disabled(buttonDisabled)
                    .padding()
                    .background(.gray.opacity(0.5))
                    .foregroundStyle(.black)
                    .clipShape(Capsule())

                    Button("Show Message") {
                        message = "You pushed the button!"
                    }
                    .padding()
                    .background(.green.opacity(0.5))
                    .foregroundStyle(.black)

                    Text(message)

                    Button("BIG BUTTON") {
                        print("Big button tapped")
                    }
                    .frame(width: 250, height: 70)
                    .background(.purple.opacity(0.5))
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
