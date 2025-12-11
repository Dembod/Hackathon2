//
//  ShareableImage.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct ShareableImage: Transferable {
    let image: UIImage

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .png) { item in
            item.image.pngData()!
        }
    }
}
