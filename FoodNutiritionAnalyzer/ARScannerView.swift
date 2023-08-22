//
//  ARScannerView.swift
//  FoodNutiritionAnalyzer
//
//  Created by Rishi Villa on 7/21/23.
//

import SwiftUI
import ARKit
import CoreML

struct ARScannerView: View {
    @Binding var scannedFood: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            ARViewContainer(scannedFood: $scannedFood)
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

