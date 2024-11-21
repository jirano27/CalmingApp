//
//  InsideFeelingSelectionScreen.swift
//  calming
//

import SwiftUI

struct RightSideFeelingSelectionScreen: View {
    @State private var selectedFeelings: Set<IndoorFeeling> = []
    @State private var showSolutions = false

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("How are you feeling indoors?")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                ForEach(IndoorFeeling.allCases, id: \.self) { feeling in
                    Toggle(feeling.rawValue, isOn: Binding<Bool>(
                        get: { selectedFeelings.contains(feeling) },
                        set: { newValue in
                            if newValue {
                                selectedFeelings.insert(feeling)
                            } else {
                                selectedFeelings.remove(feeling)
                            }
                        }))
                }

                Button("Confirm") {
                    showSolutions = true
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.blue)
                .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showSolutions) {
            RightSideSolutions(selectedFeelings: selectedFeelings)
        }
    }
}

enum IndoorFeeling: String, CaseIterable {
    case bored = "Bored"
    case restless = "Restless"
    case cozy = "Cozy"
    case creative = "Creative"
}
