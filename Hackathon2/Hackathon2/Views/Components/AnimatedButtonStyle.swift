//
//  NoTapAnimationStyle.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI

struct AnimatedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.90 : 1)
            .animation(.linear(duration: 0.1), value: configuration.isPressed)

    }
}
