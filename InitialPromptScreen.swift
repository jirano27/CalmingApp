//
//  InitialPromptScreen.swift
//  calming
//

import SwiftUI


struct InitialPromptScreen: View {
    @State private var showOutsideFeelingsScreen = false
    @State private var showInsideFeelingsScreen = false

    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink {
                    FeelingSelectionScreen()
                } label: {
                    // ...
                }
                NavigationLink {
                    RightSideFeelingSelectionScreen()
                } label: {
                    // ...
                }
            }
        }
    }
}
