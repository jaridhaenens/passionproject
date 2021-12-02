//
//  ViewpointView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 01/12/2021.
//

import SwiftUI

struct ViewpointView: View {
    var body: some View {
        VStack(alignment: .leading) {
            FindImageView()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
            Spacer()
            Text("Chapter 1")
                .font(.custom("Gilroy-Medium", size: 34))
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam rhoncus dolor vel vitae nisi, ut. Sit turpis sed mattis egestas tempor odio. Maecenas cursus nunc nibh augue vivamus fusce proin amet rhoncus. Blandit vel neque aliquam sem quis laoreet sit turpis cras. Auctor velit quisque amet, massa lorem enim. Sit felis turpis nullam gravida. Sed commodo nec nibh sagittis at et. Volutpat aliquet id egestas ac dui. Sed aliquam sed egestas elit semper viverra fringilla nibh.")
            
        }
        
        .padding(.all)
    }
}

struct ViewpointView_Previews: PreviewProvider {
    static var previews: some View {
        ViewpointView()
    }
}
