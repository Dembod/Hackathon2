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
        @Bindable var vm = vm
        
        if vm.randomImage != nil {
            ZStack {
                ScrollView {
                    VStack(spacing: 26) {
                        
                        if let error = vm.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding(.horizontal)
                        }
                        
                        if let image = vm.randomImage {
                            VStack(spacing: 4) {
                                ImageView(displayedImage: image)
                                CartelView(text: vm.cartelText)
                            }
                            Spacer()
                            TextField("Légende", text: $vm.cartelText)
                                .padding(10)
                                .background(.fond)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.bordure, lineWidth: 4)
                                        .foregroundStyle(.clear)
                                )
                        }
                        
                        Button(action: vm.loadRandomPhoto) {
                            Image(.sonnette)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                        }
                        .buttonStyle(AnimatedButtonStyle())
                        .disabled(vm.isLoading)
                        
                    }
                    .padding(.top, 40)
                    .padding()
                    .frame(maxHeight: .infinity)
                }
                
                PaperView()
            }
            .background {
                Image(.papierPeint)
            }
            
        } else {
            VStack {
                Button(action: vm.loadRandomPhoto) {
                    Image(.sonnette)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                }
                .buttonStyle(AnimatedButtonStyle())
                .disabled(vm.isLoading)
            }
            .background {
                Image(.papierPeint)
            }
        }

    }
}

#Preview {
    ImageGalleryView().environment(ViewModel())
}
