//
//  ARView.swift
//  ARFurniture
//
//  Created by Руслан Парастаев on 11.11.2024.
//

import SwiftUI

struct ARCameraView: View {
    
    let furniture: FurnitureType
    
    var body: some View {
        VStack {
            ARViewContainer(fileName: furniture.fileName())
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}
