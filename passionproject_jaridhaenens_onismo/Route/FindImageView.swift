//
//  SwiftUIView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 01/12/2021.
//

import SwiftUI

struct FindImageView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            VStack {
                Image("bird")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Text("Zoek en breng tot leven")
                    Spacer()
                    Image(systemName: "arrow.forward.circle.fill")
                }
                .padding(5)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct FindImageView_Previews: PreviewProvider {
    static var previews: some View {
        FindImageView()
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
