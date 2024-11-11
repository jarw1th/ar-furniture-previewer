//
//  ContentView.swift
//  ARFurniture
//
//  Created by Руслан Парастаев on 11.11.2024.
//

import SwiftUI

struct SelectionView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(FurnitureType.allCases, id: \.self) { furniture in
                        NavigationLink {
                            ARCameraView(furniture: furniture)
                        } label: {
                            Text(furniture.rawValue)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .font(.title)
                                .foregroundStyle(.white)
                                .background(.black)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .padding()
        }
        .preferredColorScheme(.light)
    }
    
}

#Preview {
    
    SelectionView()
    
}
