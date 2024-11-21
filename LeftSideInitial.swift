//
//  Untitled.swift
//  calming
//

import SwiftUI

struct LeftSideInitial: View {
    @Binding var showFeelingScreen: Bool

    var body: some View {
        NavigationLink {
            FeelingSelectionScreen()
        } label: {
            ZStack {
                Color.red.ignoresSafeArea()
                Text("Go Outside")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}
