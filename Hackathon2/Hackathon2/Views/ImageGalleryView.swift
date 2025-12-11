//
//  ImageView.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI

struct ImageGalleryView: View {
    @Environment(ViewModel.self) var vm

    var body: some View {
        
        VStack(spacing: 20) {
            
            if let image = vm.randomImage {
                ImageView(displayedImage: image)
            }
            
            if let error = vm.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal)
            }
            
            Button(action: vm.loadRandomPhoto) {
                HStack {
                    if vm.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                    } else {
                        Text("Une photo au hasard")
                    }
                }
            }
            .disabled(vm.isLoading)
            
        }
        .padding()
        .background {
            Image(.papierPeint)
        }

    }
}

#Preview {
    ImageGalleryView().environment(ViewModel())
}
