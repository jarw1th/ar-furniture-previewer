//
//  ARContainer.swift
//  ARFurniture
//
//  Created by Руслан Парастаев on 11.11.2024.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        if let modelEntity = try? Entity.loadModel(named: "Shelf") {
            let anchorEntity = AnchorEntity(plane: .horizontal)
            anchorEntity.addChild(modelEntity)
            arView.scene.addAnchor(anchorEntity)
        } else {
            print("Failed to load model")
        }
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
