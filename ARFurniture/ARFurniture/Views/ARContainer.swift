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
    
    let fileName: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        if let modelEntity = try? ModelEntity.load(named: fileName) {
            modelEntity.setScale(SIMD3(repeating: 0.01), relativeTo: nil)
            
            let parentEntity = ModelEntity()
            parentEntity.addChild(modelEntity)
            let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: .zero))
            anchor.addChild(parentEntity)
            arView.scene.addAnchor(anchor)
               
            modelEntity.availableAnimations.forEach { modelEntity.playAnimation($0.repeat()) }
               
            let entityBounds = modelEntity.visualBounds(relativeTo: parentEntity)
            parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds.extents).offsetBy(translation: entityBounds.center)])
                           
            arView.installGestures(for: parentEntity)
        }
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
