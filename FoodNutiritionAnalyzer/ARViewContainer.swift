import SwiftUI
import SceneKit
import ARKit

struct ARViewContainer: UIViewControllerRepresentable {
    @Binding var scannedFood: String

    func makeUIViewController(context: Context) -> ViewController {
        let viewController = ViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // You can add code here to update the ViewController if needed
    }
}
