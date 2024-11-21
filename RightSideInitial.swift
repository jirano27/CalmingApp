//
//  RightSideInitial.swift
//  calming
//

import SwiftUI

struct RightSideInitial: View {
    @State private var showInsideFeelingsScreen = false

    var body: some View {
        NavigationStack {
            HStack {
                // ... other content
                NavigationLink {
                    RightSideFeelingSelectionScreen()
                } label: {
                    // Customize the button appearance for the right side
                    Text("Indoor Feelings")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}
