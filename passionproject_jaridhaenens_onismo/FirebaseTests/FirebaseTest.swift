//
//  FirebaseTest.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 16/12/2021.
//

import SwiftUI

struct FirebaseTest: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        List (model.list) { item in
            NavigationLink(destination: ChapterTest()) {
                Text(item.city)
            }
        }
        
//        List (model.chapterList) { item in
//            Text(item.name)
//        }
        Text("hey")
    }
    
    init() {
        model.getData()
//        model.getDataChapter(tourId: String)
    }
}

struct FirebaseTest_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseTest()
    }
}
