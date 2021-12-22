//
//  ChapterTest.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 16/12/2021.
//

import SwiftUI




struct ChapterTest: View {
    
    //    @Binding var tourId: String
    
//    var progress: Progress

    @EnvironmentObject var progressModel: ProgressModel
    
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
                    Text("\(item.name)")
                        .font(.custom("Gilroy-ExtraBold", size: 25))
                        .foregroundColor(Color("titleColor"))
                        .padding(.vertical, 7.0)
                    
                    Text(item.description)
                        .font(.custom("Poppins-Regular", size: 16))
                        .tracking(0.6)
                        .padding(.bottom, 40.0)
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                NavigationLink(destination: ViewpointView(chapter: item)) {
                    HStack {
                        Text("Ik ben op de locatie")
                        Image(systemName: "arrow.forward.circle.fill")
                    }
                }
//                .buttonStyle(PlainButtonStyle())
            }
            
        }
        .onAppear() {
//            var chapterNum: Double = 0
            print(progressModel.currentChapter)
            chapterModel.getDataChapter(tourId: "Ru6BALZFVhyBI9lBh3VO", chapterId: progressModel.currentChapter)
            print("loaded")
        }
    }
    
//    init() {
//       
//    }
    
}

struct ChapterTest_Previews: PreviewProvider {
    static var previews: some View {
        ChapterTest()
    }
}
