////
////  ArController.swift
////  passionproject_jaridhaenens_onismo
////
////  Created by Jari D'haenens on 01/12/2021.
////
//
//import Foundation
//import RealityKit
//import ARKit
//
//class ArController: UIViewController {
//    @IBOutlet var arView: ARView!
//    var arEntity: ModelEntity?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        startARSession()
//        
//        // Load 3D Model
//        arEntity = try! Entity.loadModel(named: "toy_drummer")
//        
//        // Tap detector
//        arView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer: ))))
//    }
//    
//    
//    @objc
//    func handleTap(recognizer: UITapGestureRecognizer) {
//        // Tap location (2D)
//        let tapLocation = recognizer.location(in: arView)
//        
//        // Raycast (2D -> 3D point)
//        let results = arView.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
//        
//        
//        // If plane detected
//        if let firstResult = results.first{
//            
//            // 3D position
//            let worldPos = simd_make_float3(firstResult.worldTransform.columns.3)
//            
//            // Place object
//            placeObject(object: arEntity!, position: worldPos)
//        }
//    }
//    
//    func startARSession() {
//        arView.automaticallyConfigureSession = true
//        
//        //Plane detection
//        let configuration = ARWorldTrackingConfiguration ()
//        configuration.planeDetection = [.horizontal]
//        configuration.environmentTexturing = .automatic
//        
//        arView.debugOptions = .showAnchorGeometry
//        arView.session.run(configuration)
//    }
// 
//    func placeObject(object:ModelEntity, position: SIMD3<Float>) {
//        // 1. Create anchor at 3D position
//        let objectAnchor = AnchorEntity(world: position)
//        
//        // 2. Tie model to anchor
//        objectAnchor.addChild(object)
//        
//        // 3. Anchor scene
//        arView.scene.addAnchor(objectAnchor)
//    }
//}
