//
//  AuthorizationView.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI

struct AuthorizationView: View {
    @Environment(ViewModel.self) var vm
    
    var body: some View {
        
        
        ZStack {
            
            VStack(spacing: 20) {
                
                Text("Sois gentil·le, laisse nous voir ta galerie photos... 😈")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.headline)
                
                
                Button("Ouvre nous ta porte") {
                    vm.requestPhotoLibraryAccess()
                }
                .foregroundStyle(.yellow)
                .bold()
                
            }
            .padding()
            .background(.porteCouleur.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 20)
            )
            
        }
        .frame(maxHeight: .infinity)
        .background {
            Image(.porte)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x:-51)
        }
        
    }
}

#Preview {
    AuthorizationView().environment(ViewModel())
}
