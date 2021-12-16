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
    @State var shouldNavigate = false
    
    var body: some View {
        VStack {
            RouteView()
                .onAppear {
                    viewModel.checkIfLocationManagerIsEnabled()
                }
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Chapter 1")
                    .font(.custom("Gilroy-ExtraBold", size: 25))
                    .foregroundColor(Color("titleColor"))
                    .padding(.vertical, 7.0)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit augmented reality. Pellentesque habitant morbi tristique senectus.")
                    .font(.custom("Poppins-Regular", size: 16))
                    .tracking(0.6)
                    .padding(.bottom, 40.0)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            NavigationLink(destination: ViewpointView()) {
                Text("Press on me")
            }
            .buttonStyle(PlainButtonStyle())
            
            
        }
        .ignoresSafeArea()
        
    }
}



struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterView()
    }
}
