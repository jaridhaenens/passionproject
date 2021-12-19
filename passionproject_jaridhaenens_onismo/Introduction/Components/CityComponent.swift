//
//  CityComponent.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 17/12/2021.
//

import SwiftUI
import URLImage

struct CityComponent: View {
    var city: Tour
    
    var body: some View {
//        let url = URL(string: city.image)
        let url = URL(string: "https://i.ibb.co\(city.image)")
        VStack(alignment: .leading) {
//            Image("ghent_cover")
//                .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 180)
            URLImage(url!) { image in
                image
//                    .scaledToFit()
                    .resizable()
                .frame(width: 300, height: 180)
            }
            
            Text("Gent")
            
            Spacer()

        }
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

//struct CityComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        CityComponent()
//
//    }
//}
