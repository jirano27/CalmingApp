//
//  ContentView.swift
//  calming
//

import SwiftUI


struct ContentView: View {
    @State private var showWelcomeScreen = true
    @State private var showLeftSide = false
    @State private var showRightSide = false

    var body: some View {
        ZStack {
            if showWelcomeScreen {
                WelcomeScreen()
                    .transition(.opacity)
            } else {
                HStack {
                    Button {
                        showLeftSide = true
                    } label: {
                        ZStack {
                            Color.red.ignoresSafeArea()
                            VStack {
                                Text("Go Outside")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .sheet(isPresented: $showLeftSide) {
                        FeelingSelectionScreen()
                    }

                    Button {
                        showRightSide = true
                    } label: {
                        ZStack {
                            Color.blue.ignoresSafeArea()
                            VStack {
                                Text("Stay Inside")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .sheet(isPresented: $showRightSide) {
                        RightSideFeelingSelectionScreen()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 1)) {
                    showWelcomeScreen = false
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeScreen: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("Welcome to the Calming App")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}
