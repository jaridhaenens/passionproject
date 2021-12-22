//
//  ToursOverview.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 17/12/2021.
//

import SwiftUI

struct ToursOverview: View {
    
    @ObservedObject var model = ViewModel()
    @ObservedObject var countModel = CountChaptersModel()
    
    @EnvironmentObject var progressModel: ProgressModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Steden in jouw buurt")
                    .font(.custom("Gilroy-ExtraBold", size: 25))
                    .foregroundColor(Color("titleColor"))
                    .padding(.bottom, 10.0)
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(model.list) { item in
                            NavigationLink(destination:FirstLocationView(city: item)) {
                                CityComponent(city: item)
                                    .frame(width: 300, height: 250)
                                    .cornerRadius(3.0)
                            }
                        }
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Ontgrendelde objecten")
                    .font(.custom("Gilroy-ExtraBold", size: 25))
                    .padding(.bottom, 10.0)
                    .padding(.top)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                if progressModel.capturedModels.count > 1 {
                    VStack {
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(progressModel.capturedModels, id: \.self) { model in
                                    Image(model)
                                        .resizable()
                                        .frame(height: 80)
                                        .aspectRatio(1/1, contentMode: .fit)
                                        .cornerRadius(12)
                                }
                            }
                        }
                    }
                    NavigationLink(destination: ArViewCaptured(models: progressModel.capturedModels)){
                        Text("Breng jouw objecten tot leven")
                            .font(.custom("Gilroy-ExtraBold", size: 17))
                            .foregroundColor(Color("primaryColor"))
                            .background(Color.white)
                        Image("arrow_left")
                    }
                    
                    .padding()
                } else {
                    Text("Je hebt nog geen ontgrendelde objecten")
                        .foregroundColor(Color.red)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color("primaryColor"))
            .foregroundColor(Color.white)
            
        }
    }
    
    init() {
        model.getData()
    }
}

struct ToursOverview_Previews: PreviewProvider {
    static var previews: some View {
        ToursOverview()
    }
}
