//
//  ArView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 01/12/2021.
//

import RealityKit
import SwiftUI
import ARKit
import FocusEntity

struct ArView: View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: String?
    @State private var modelConfirmedForPlacement: String?
    
    var models: [String] = ["toy_drummer", "gramophone", "toy_car"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            
            if self.isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
                    .padding(.bottom)
            } else {
                ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, models: self.models)
            }
            
            
        }
        .ignoresSafeArea(.all)
    }
}

var arEntity: ModelEntity?


struct ARViewContainer: UIViewRepresentable {
    
    @Binding var modelConfirmedForPlacement: String?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        let focusSquare =  FocusEntity(on: arView, style: .classic(color: .yellow))

        arView.session.run(config)
        
        
        // Load the "Box" scene from the "Experience" Reality File
//         let boxAnchor = try! Experience.loadBox()
        
        // working loopable model
//        if let anchor = try? Entity.loadAnchor(named: "toy_drummer") {
//            arView.scene.addAnchor(anchor)
//            anchor.availableAnimations.forEach {
//                anchor.playAnimation($0.repeat())
//            }
//        }
        
        // Add the box anchor to the scene
        // arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName = self.modelConfirmedForPlacement {
            print("adding model to scene - \(modelName)")
            
            let fileName = modelName + ".usdz"
            let modelEntity = try! ModelEntity.loadModel(named: fileName)
            let anchorEntity = AnchorEntity(plane: .any)
            
            anchorEntity.addChild(modelEntity)
            uiView.scene.addAnchor(anchorEntity)
            
            anchorEntity.availableAnimations.forEach {
                anchorEntity.playAnimation($0.repeat())
            }
            
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
            
        }
    }
    
}

class CustomARView: ARView {
    
}


struct ModelPickerView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    
    var models: [String]
    
    var body: some View {
        
        HStack {
            ForEach(0 ..< self.models.count){
                index in
                Button(action: {
                    print("selected model:\(self.models[index])")
                    self.isPlacementEnabled = true
                    
                    self.selectedModel = self.models[index]
                }) {
                    Image(uiImage: UIImage(named: self.models[index])!)
                        .resizable()
                        .frame(height: 80)
                        .aspectRatio(1/1, contentMode: .fit)
                        .cornerRadius(12)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}

struct PlacementButtonsView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    @Binding var modelConfirmedForPlacement: String?
    
    var body: some View {
        HStack {
            
            // Cancel button
            Button(action: {
                print("Model placement canceled.")
                self.resetPlacementParameters()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.red)
            }
            
            // Confirm button
            Button(action: {
                print("Model placement confirmed.")
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.green)
            }
        }
    }
    
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
}

struct ArView_Previews: PreviewProvider {
    static var previews: some View {
        ArView()
    }
}
