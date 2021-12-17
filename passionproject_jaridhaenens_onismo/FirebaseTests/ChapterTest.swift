//
//  ChapterTest.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 16/12/2021.
//

import SwiftUI


struct ChapterTest: View {
    
    //    @Binding var tourId: String
    @ObservedObject var chapterModel = ChapterModelView()
    @StateObject private var viewModel = CurrentLocationView()
    @State var shouldNavigate = false
    
    var body: some View {
        
        VStack {
            ForEach(chapterModel.chapterItem) { item in
                RouteView(item: item)
                    .onAppear {
                        viewModel.checkIfLocationManagerIsEnabled()
                    }
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("\(item.name) at lat:\(item.latitude) and long:\(item.longitude)")
                        .font(.custom("Gilroy-ExtraBold", size: 25))
                        .foregroundColor(Color("titleColor"))
                        .padding(.vertical, 7.0)
                    
                    Text(item.text)
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
            
        }
    }
    
    init() {
        chapterModel.getDataChapter(tourId: "Ru6BALZFVhyBI9lBh3VO", chapterId: 1)
    }
    
}

struct ChapterTest_Previews: PreviewProvider {
    static var previews: some View {
        ChapterTest()
    }
}
