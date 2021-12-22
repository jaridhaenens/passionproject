//
//  launchView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 06/12/2021.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("primaryColor"))
            .padding(.bottom)
            
            
            VStack(alignment: .leading) {
                Text("Ontdek en\nbreng de stad\ntot leven")
                    .font(.custom("Gilroy-ExtraBold", size: 45))
                    .foregroundColor(Color("titleColor"))
                
                Group {
                    Text("De ")
                        .font(.custom("Poppins-Regular", size: 16))
                        .tracking(0.6)
                        
                        + Text("Onismo ")
                        .bold()
                        
                        + Text("app maakt het mogelijk om een stad op een nieuwe manier te ontdekken, het beschikt over een ")
                        .font(.custom("Poppins-Regular", size: 16))
                        .tracking(0.6)
                        
                        + Text("fotozoektocht ")
                        
                        + Text("op basis van ")
                        .font(.custom("Poppins-Regular", size: 16))
                        .tracking(0.6)
                        
                        + Text("Artificial Intellegence ")
                        .bold()
                        
                        + Text("die dan het gevonden object tot leven brengt met ")
                        .font(.custom("Poppins-Regular", size: 16))
                        .tracking(0.6)
                        
                        + Text("Augmented Reality.")
                        .bold()
                }
                    

                NavigationLink(destination: ToursOverview()) {
                    HStack {
                        Text("Let’s Go!")
                            .font(.custom("Gilroy-ExtraBold", size: 17))
                            .foregroundColor(Color.white)
                        
                        Image("arrow_left")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .frame(minWidth: 160, idealWidth: 160, minHeight: 45, idealHeight: 45)
                .background(Color("darkColor"))
                .cornerRadius(60)
                .hoverEffect()
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
