//
//  LeftSideSolution.swift
//  calming
//

import SwiftUI
import WebKit
import MapKit

struct FeelingData {
    let feeling: Feeling
    let locationName: String
    let locationAddress: String
    let activityName: String
    let activityDescription: String
    let youtubeLink: String
    let latitude: Double
    let longitude: Double
}

struct LeftSideSolutions: View {
    let selectedFeelings: Set<Feeling>


    let feelingData: [FeelingData] = [
        FeelingData(feeling: .angry, locationName: "Exercise", locationAddress: "Gym", activityName: "123 Gym St", activityDescription: "Get your energy out", youtubeLink: "https://www.youtube.com/watch?v=sl9OmHy6c6o&ab_channel=HistoryUnleashed", latitude: 20.8443, longitude: -106.6694),
        FeelingData(feeling: .anxious, locationName: "Meditation", locationAddress: "Quiet Room", activityName: "456 Quiet St", activityDescription: "Calm your mind", youtubeLink: "https://www.youtube.com/watch?v=caq8XpjAswo&ab_channel=MindfulPeace", latitude: 33.7515, longitude: -117.7549),
        FeelingData(feeling: .sad, locationName: "Listen to Music", locationAddress: "Bedroom", activityName: "789 Bedroom Ave", activityDescription: "Boost your mood", youtubeLink: "https://www.youtube.com/watch?v=eVli-tstM5E&list=RDEM-vPeq_YvV4om2VwqZu4mDw&start_radio=1&ab_channel=SabrinaCarpenterVEVO", latitude: 33.72890595628581, longitude: -117.98969756462421),
        FeelingData(feeling: .tired, locationName: "Take a Nap", locationAddress: "Bedroom", activityName: "789 Bedroom Ave", activityDescription: "Rest and recharge", youtubeLink: "https://www.youtube.com/watch?v=44tiZ7IP7zA&ab_channel=BabyRelaxChannel", latitude: 33.72890595628581, longitude: -117.98969756462421),
        FeelingData(feeling: .happy, locationName: "Swimming", locationAddress: "Beach", activityName: "123 Beach Rd", activityDescription: "Enjoy the sun and water", youtubeLink: "https://www.youtube.com/watch?v=btPJPFnesV4&ab_channel=SurvivorVEVO", latitude: 37.733477, longitude: -122.505978),
        FeelingData(feeling: .excited, locationName: "Hiking", locationAddress: "Mountain", activityName: "101 Mountain Way", activityDescription: "Explore nature", youtubeLink: "https://www.youtube.com/watch?v=9rVKos-oGnQ&ab_channel=AniplexUSA", latitude: 37.8651, longitude: -119.5383),
    ]

    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("Possible Solutions")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                List {
                    ForEach(Array(selectedFeelings), id: \.self) { feeling in
                        Section(header: Text(feeling.rawValue)) {
                            if let data = feelingData.first(where: { $0.feeling == feeling }) {
                                SolutionView(data: data)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct SolutionView: View {
//    let data: FeelingData
//
//    var body: some View {
//        VStack {
//            Text(data.activityName)
//            Text(data.locationName)
//            Text(data.locationAddress)
//            MapView(coordinate: CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude))
//                .frame(width: 300, height: 200)
//            WebView(url: URL(string: data.youtubeLink)!)
//                            .frame(width: 300, height: 200) // Adjust the size as needed
//        }
//        .padding()
//    }
//}

//struct SolutionView: View {
//    let data: FeelingData
//
//    var body: some View {
//        VStack {
//            Text(data.activityName)
//            Text(data.locationName)
//            Text(data.locationAddress)
//            MapView(coordinate: CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude))
//                .frame(width: 300, height: 200)
//            Link(destination: URL(string: "maps://?ll=\(data.latitude),\(data.longitude)&q=\(data.locationName)")!) {
//                Text("View on Map")
//            }
//
//            WebView(url: URL(string: data.youtubeLink)!)
//                .frame(width: 300, height: 200)
//        }
//        .padding()
//    }
//}

struct SolutionView: View {
    let data: FeelingData

    var body: some View {
        VStack {
            Text(data.activityName)
            Text(data.locationName)
            Text(data.locationAddress)

            Link(destination: URL(string: "maps://?ll=\(data.latitude),\(data.longitude)&q=\(data.locationName)")!) {
                MapView(coordinate: CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude))
                    .frame(width: 300, height: 200)
                .frame(width: 300, height: 200)
            }

            WebView(url: URL(string: data.youtubeLink)!)
                .frame(width: 300, height: 200)
        }
        .padding()
    }
}


struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        // Configure the web view to display the thumbnail only
        webView.scrollView.isScrollEnabled = false
        webView.allowsBackForwardNavigationGestures = false
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No need to update the URL, as it's loaded once in `makeUIView`
    }
}

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Location"
        mapView.addAnnotation(annotation)
        mapView.region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // No updates needed
    }
}
