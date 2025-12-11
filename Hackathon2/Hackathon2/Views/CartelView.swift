//
//  CartelView.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI

struct CartelView: View {
    var text: String = "Si le texte est vraiment très long ça donne quoi ?? Ça tient sans problèmes"
    
    var body: some View {
        
        ZStack {
            Image(.cartel)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            Text(text.uppercased())
                .font(.custom("Leander", size: 8))
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
                .foregroundStyle(.black)
                .opacity(0.8)
                .frame(width: 155)
        }
        
    }
}

#Preview {
    CartelView()
}
