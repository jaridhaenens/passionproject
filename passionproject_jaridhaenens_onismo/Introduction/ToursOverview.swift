//
//  ToursOverview.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 17/12/2021.
//

import SwiftUI

struct ToursOverview: View {
    
    @ObservedObject var model = ViewModel()

    var body: some View {
        List (model.list) { item in
            NavigationLink(destination: ChapterTest()) {
                Text(item.city)
            }
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(model.list) { item in
//                    NavigationLink(destination: ViewpointView()) {
                    NavigationLink(destination:FirstLocationView(city: item)) {
                        CityComponent(city: item)
                            .frame(width: 300, height: 250)
                    }
                }
                
            }
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
