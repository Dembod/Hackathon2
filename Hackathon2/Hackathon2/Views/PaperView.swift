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
                if let randomImage = vm.randomImage {
                    ShareLink(item: ShareableImage(image: randomImage), preview: SharePreview(vm.cartelText, image: ShareableImage(image: randomImage))) {
                            Image(.papier)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                    }
                    .offset(x: 70, y: 100)
                    .rotationEffect(Angle(degrees: -20))
                    .buttonStyle(AnimatedButtonStyle())
                }

//                    let renderer = ImageRenderer(content: ImageGalleryView())
//                    if let image = renderer.cgImage {
//                        Image(image)
//                    }
            }
        }
    }
}

#Preview {
    PaperView()
}
