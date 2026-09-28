import SwiftUI
import Playgrounds



struct ContentView: View {
    
    var body: some View{
        
        NavigationStack{
            
            List{
                
                NavigationLink{
                    SoundScreen()
                } label: {
                    Label("Sound", systemImage: "speaker.wave.2.fill")
                }
                NavigationLink {
                    DisplayScreen()
                } label: {
                    Label("Display", systemImage: "sun.max.fill")
                }
                NavigationLink{
                    PrivacyScreen()
                } label: {
                    Label("Privacy", systemImage: "lock.fill")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SoundScreen: View {
    var body: some View{
        Text("Sound Settings")
            .navigationTitle("Sound")
    }
}

struct DisplayScreen: View{
    var body: some View{
        Text("Display Settings")
            .navigationTitle("Display")
    }
}

struct PrivacyScreen: View{
    var body: some View{
        Text("Privacy Settings")
            .navigationTitle("Privacy")
    }
}

#Preview {
    ContentView()
}



enum VendingErrors: Error {
    case outOfStock, notEnoughMoney, invaildSelction, cardLocked
}

