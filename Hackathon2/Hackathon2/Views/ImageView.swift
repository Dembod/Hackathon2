//
//  Untitled.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI

struct ImageView: View {
    var displayedImage: UIImage = .test
    
    var body: some View {
        
        ZStack {
            
            Image(uiImage: displayedImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 260, height: 220, alignment: .center)
                .clipped()
                        
            Image(.cadre)
                .resizable()
                .scaledToFit()
                .frame(width: 400)
            
        }
    }
}

#Preview {
    ImageView()
}
