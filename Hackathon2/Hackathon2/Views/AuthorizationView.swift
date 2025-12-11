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
        
        VStack(spacing: 20) {
            
            Text("L'accès à la librairie de photos est requis pour cette application.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button("Autoriser") {
                vm.requestPhotoLibraryAccess()
            }
            
        }
        .padding()
    }
}

#Preview {
    AuthorizationView().environment(ViewModel())
}
