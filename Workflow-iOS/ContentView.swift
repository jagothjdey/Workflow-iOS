import SwiftUI
import GridStack

struct ContentView: View {
    @State private var name: String =  ""
    
    private var greeterText: String {
        name.isEmpty ? "" : "Nice to meet you, \(name)."
    }
    
    var body: some View {
        VStack {
            Text("Please enter your name below")
                .accessibility(identifier: "enterNameLabel")
            TextField("Your name", text: $name)
            Text(greeterText)
                .accessibility(identifier: "greetingTextLabel")
        }.padding()
    }
}
