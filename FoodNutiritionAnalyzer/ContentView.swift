import SwiftUI

struct ContentView: View {
    @State private var scannedFood: String = ""

    var body: some View {
        ZStack {
            ARViewContainer(scannedFood: $scannedFood)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Your UI content for the home view goes here
                
                Text("Scanned Food: \(scannedFood)")
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}
