import SwiftUI
import ARKit
import CoreML

struct HomeView: View {
    @State private var isShowingARScanner = false
    @State private var isShowingSettings = false
    @State private var isShowingLoginSignUp = false
    @State private var scannedFood: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 30) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)

                    Text("Eat Healthy, Live Healthy")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Get to know your food, one scan at a time")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(.white)

                    Button(action: {
                        isShowingARScanner = true // Directly navigate to ARScannerView
                    }) {
                        Text("Start Scanning")
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: $isShowingARScanner) {
                        ARScannerView(scannedFood: $scannedFood)
                    }

                    Button(action: {
                        isShowingLoginSignUp = true
                    }) {
                        Text("Login / Sign Up")
                            .foregroundColor(.white)
                            .underline()
                    }
                    .padding(.top)
                    .sheet(isPresented: $isShowingLoginSignUp) {
                        SignUpView()
                    }

                    Spacer()
                }
                .padding()
                .navigationBarTitle("Home", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "gear")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .fullScreenCover(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                )
            }
        }
    }
}





