//
//  FeelingSelectionScreen.swift
//  calming
//

import SwiftUI


struct FeelingSelectionScreen: View {
    @State var selectedFeelings: Set<Feeling> = []
    @State private var showSolutions = false

    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("How are you feeling outdoors?")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                ForEach(Feeling.allCases, id: \.self) { feeling in
                    Toggle(feeling.rawValue, isOn: Binding(get: {
                        selectedFeelings.contains(feeling)
                    }, set: { newValue in
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
                .foregroundColor(.red)
                .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showSolutions) {
            LeftSideSolutions(selectedFeelings: selectedFeelings)
        }
    }
}

enum Feeling: String, CaseIterable {
    case angry = "Angry"
    case anxious = "Anxious"
    case sad = "Sad"
    case tired = "Tired"
    case happy = "Happy"
    case excited = "Excited"
    // ... add more feelings as needed
}
