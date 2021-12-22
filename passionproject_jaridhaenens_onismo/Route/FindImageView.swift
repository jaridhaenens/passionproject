//
//  SwiftUIView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 01/12/2021.
//

import SwiftUI

struct FindImageView: View {
    
    var chapter: Chapter
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack {
                Image(chapter.imageAi)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                HStack{
                    Text("Zoek en breng tot leven")
                    Spacer()
                    Image(systemName: "arrow.forward.circle.fill")
                }
                .padding(10)
                .foregroundColor(Color.white)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//struct FindImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        FindImageView()
//            .previewLayout(.fixed(width: 300, height: 200))
//    }
//}
