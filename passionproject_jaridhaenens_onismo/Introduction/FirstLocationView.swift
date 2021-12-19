//
//  FirstLocationView.swift
//  compentsbuilder
//
//  Created by Jari D'haenens on 17/12/2021.
//

import SwiftUI
import MapKit

let latitudeH = 51.03707
let longitudeH = 3.70982

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude = 51.03707
    let longitude = 3.70982
}

struct FirstLocationView: View {
    
    @StateObject private var viewModel = CurrentLocationView()
    var city: Tour
    
    let places = [
        Place(name: "British Museum"),
    ]
    
    
    
    // 2
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 51.03707, longitude: 3.70982)
    }
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.03707, longitude: 3.70982),
        span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075))
    
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places) { place in
                MapMarker(coordinate: coordinate)
            }
            .ignoresSafeArea(.all)
            .padding(.bottom, 40.0)
            
            Group { Text(city.city) + Text("Maria Hendrika Plein, nabij het station Gent-Sint-Pieters")
                .bold()
                + Text("")}
                .padding()
            
            
            Button(
                action: {
                    
                    let url = URL(string: "http://maps.apple.com/?daddr=\(latitudeH),\(longitudeH)")
                    if UIApplication.shared.canOpenURL(url!) {
                        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                }, label: {
                    HStack {
                        Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                        Text("Maak een route")
                        
                    }
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(3)
                }
            )
            .padding(.top, 9.0)
            
            NavigationLink(destination: ChapterTest()) {
                Text("Ik ben op de locatie")
            }
            .padding(.vertical, 3.0)
            
            Spacer()
        }
    }
}


//struct FirstLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstLocationView()
//    }
//}
