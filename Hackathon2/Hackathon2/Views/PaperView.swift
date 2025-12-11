//
//  PaperView.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI

struct PaperView: View {
    @Environment(ViewModel.self) var vm

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                if let screenshot = vm.screenshot {
                    ShareLink(
                        item: ShareableImage(image: screenshot),
                        preview: SharePreview(vm.cartelText, image: ShareableImage(image: screenshot))
                    ) {
                        Image(.papier)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                    .offset(x: 70, y: 100)
                    .rotationEffect(Angle(degrees: -20))
                    .buttonStyle(AnimatedButtonStyle())
                    
                    .simultaneousGesture(TapGesture()
                        .onEnded { _ in
                            vm.isTakingScreenshot = true
                        })
                }

//                    let renderer = ImageRenderer(content: ImageGalleryView())
//                    if let image = renderer.cgImage {
//                        Image(image)
//                    }
            }
        }
    }
}
