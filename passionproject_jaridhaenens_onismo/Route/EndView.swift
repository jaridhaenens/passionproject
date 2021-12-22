//
//  EndView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 22/12/2021.
//

import SwiftUI

struct EndView: View {
    var body: some View {
        
        VStack {
            Text("Yes! Je bent aan het einde van de tour.")
                .font(.custom("Gilroy-ExtraBold", size: 30))
                .foregroundColor(Color("titleColor"))
            NavigationLink(destination: ToursOverview().navigationBarBackButtonHidden(true)){
                HStack {
                    Text("Ga terug naar het begin")
                        .font(.custom("Gilroy-ExtraBold", size: 17))
                        .foregroundColor(Color.white)
                    Image(systemName: "arrow.forward.circle.fill")
                        .foregroundColor(Color.white)
                }
                .frame(minWidth: 160, idealWidth: 160, minHeight: 45, idealHeight: 45)
                .background(Color("darkColor"))
                .cornerRadius(60)
                .padding()
            }
        }
        
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
