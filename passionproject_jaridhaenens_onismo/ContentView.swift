//
//  ContentView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 30/11/2021.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            //            ARViewContainer().edgesIgnoringSafeArea(.all)
            //
            //            Text("Hello")
            NavigationView {
                LaunchView()
                    .edgesIgnoringSafeArea(.all)
            }
            //            ContentView()
        }
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
