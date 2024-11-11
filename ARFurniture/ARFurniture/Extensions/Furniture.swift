//
//  Furniture.swift
//  ARFurniture
//
//  Created by Руслан Парастаев on 11.11.2024.
//

import Foundation

enum FurnitureType: String, CaseIterable {
    
    case shelf
    case chair
    case couch
    case bed
    case table
    
    func fileName() -> String {
        switch self {
        case .shelf:
            "Shelf"
        case .chair:
            "Chair"
        case .couch:
            "Couch"
        case .bed:
            "Bed"
        case .table:
            "Table"
        }
    }
    
}
