//
//  ScreenshotMakerUIView.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import UIKit

public class ScreenshotMakerUIView: UIView, ScreenshotMaker {
    /// Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    public func screenshot() -> UIImage? {
        guard let containerView = self.superview?.superview,
              let containerSuperview = containerView.superview else { return nil }
        
        let captureBounds = containerView.frame
        let renderer = UIGraphicsImageRenderer(bounds: captureBounds)
        
        // REMPLACEZ "BackgroundImageName" par le nom de votre image dans Assets.xcassets
        let backgroundImage = UIImage(named: "papierPeint")
        
        return renderer.image { (context) in
            
            // 1. Dessinez l'image de fond en premier
            if let bgImage = backgroundImage {
                bgImage.draw(in: captureBounds) 
            }
            
            // 2. Rendez le contenu de la vue par-dessus (le code existant)
            containerSuperview.layer.render(in: context.cgContext)
        }
    }
}
