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
                            .padding()
                            .screenshotMaker { screenshotMaker in
                                vm.screenshot = screenshotMaker.screenshot()
                            }
                            
                            Spacer()
                            TextField("Ajoute ta légende", text: $vm.cartelText)
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
            ZStack {
                VStack {
                    ZStack {
                        Text("DaguerroMachin")
                            .foregroundStyle(Color.gray.opacity(0.8))
                        
                        
                        Text("DaguerroMachin")
                            .offset(x: -3, y: -3)
                    }
                    .font(.custom("Leander", size: 50 ))
                    .padding(.top, 40)
                    Spacer()
                }
                Button(action: vm.loadRandomPhoto) {
                    Image(.sonnette)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                }
                .buttonStyle(AnimatedButtonStyle())
                .disabled(vm.isLoading)
                
                if vm.isPresented {
                    VStack {
                        Spacer()
                        VStack {
                            Text("Vas-y CLIQUE !")
                                .font(.custom("Leander", size: 40))
                            
                            Text("N'aie pas peur...")
                                .font(.custom("Leander", size: 20))
                        }
                        .padding()
                        .background(.fond)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.gray, radius: 10)
                        .padding(.bottom, 30)
                    }
                }
            }
            .task {
                try? await Task.sleep(nanoseconds: 10_000_000_000)
                vm.isPresented = true
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
