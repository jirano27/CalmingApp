//
//  RightSideSolutioin.swift
//  calming
//

import SwiftUI

struct RightSideSolutions: View {
    let selectedFeelings: Set<IndoorFeeling>

    let indoorFeelingData: [IndoorFeelingData] = [
        IndoorFeelingData(feeling: .bored, activity: "Read a Book", location: "Cozy Corner", youtubeLink: "https://www.youtube.com/watch?v=84VVFgGmeSA&ab_channel=JustFreeAudiobooks"),
        IndoorFeelingData(feeling: .restless, activity: "Do Some Yoga", location: "Living Room", youtubeLink: "https://www.youtube.com/watch?v=hJbRpHZr_d0&ab_channel=YogaWithAdriene"),
        IndoorFeelingData(feeling: .cozy, activity: "Drink Hot Chocolate", location: "Kitchen", youtubeLink: "https://www.youtube.com/watch?v=pn-W0DVQw8Y&ab_channel=JoshuaWeissman"),
        IndoorFeelingData(feeling: .creative, activity: "Paint or Draw", location: "Art Room", youtubeLink: "https://www.youtube.com/watch?v=1jjmOF1hQqI&ab_channel=DrawlikeaSir")
    ]

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("Possible Solutions")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                List {
                    ForEach(Array(selectedFeelings), id: \.self) { feeling in
                        Section(header: Text(feeling.rawValue)) {
                            if let data = indoorFeelingData.first(where: { $0.feeling == feeling }) {
                                RightSideSolutionView(data: data)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct IndoorFeelingData {
    let feeling: IndoorFeeling
    let activity: String
    let location: String
    let youtubeLink: String
}

struct RightSideSolutionView: View {
    let data: IndoorFeelingData

    var body: some View {
        VStack {
            Text(data.activity)
            Text(data.location)
            WebView(url: URL(string: data.youtubeLink)!)
                .frame(width: 300, height: 200) // Adjust the size as needed
        }
        .padding()
    }
}
