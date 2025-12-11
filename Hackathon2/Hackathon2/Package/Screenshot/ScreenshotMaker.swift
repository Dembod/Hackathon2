//
//  ScreenshotMaker.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import UIKit

public protocol ScreenshotMaker {
    // Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    func screenshot() -> UIImage?
}
