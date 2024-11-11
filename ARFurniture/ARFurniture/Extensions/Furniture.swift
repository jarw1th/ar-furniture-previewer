//
//  Furniture.swift
//  ARFurniture
//
//  Created by Руслан Парастаев on 11.11.2024.
//

import Foundation

enum FurnitureType: String, CaseIterable {
    
    case shelf
    
    func fileName() -> String {
        switch self {
        case .shelf:
            "Shelf"
        }
    }
    
}
