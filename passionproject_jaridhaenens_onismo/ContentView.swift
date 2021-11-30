//
//  ContentView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 30/11/2021.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        VStack {
//            ARViewContainer().edgesIgnoringSafeArea(.all)
//
//            Text("Hello")
            ChapterView()
            
//            ContentView()
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
