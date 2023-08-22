import SwiftUI

struct ImageScannerView: View {
    @Binding var scannedFood: String
    @Binding var isShowingARScanner: Bool

    var body: some View {
        VStack {
            Text("Scan your food item")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Button(action: {
                isShowingARScanner = true
            }) {
                Text("Capture Image")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            if !scannedFood.isEmpty {
                Text("Scanned Food: \(scannedFood)")
                    .font(.headline)
                    .padding()
            }

            Spacer()
        }
        .fullScreenCover(isPresented: $isShowingARScanner) {
            ARScannerView(scannedFood: $scannedFood)
        }
    }
}
