//
//  ContentView.swift
//  onismo
//
//  Created by Jari D'haenens on 30/11/2021.
//

import MapKit
import SwiftUI

struct ChapterView: View {
    
    @StateObject private var viewModel = CurrentLocationView()
    var body: some View {
        VStack {
            RouteView()
                .onAppear {
                    viewModel.checkIfLocationManagerIsEnabled()
                }
                .ignoresSafeArea()
            
//            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
//                .ignoresSafeArea()
//                .accentColor(Color(.systemPink))
//                .onAppear {
//                    viewModel.checkIfLocationManagerIsEnabled()
//                }
            
            VStack(alignment: .leading) {
                Text("Chapter 1")
                    .font(.custom("Gilroy-Medium", size: 34))
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit augmented reality. Pellentesque habitant morbi tristique senectus.")
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .ignoresSafeArea()
    }
}



struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterView()
    }
}
