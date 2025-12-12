//
//  ViewModel.swift
//  Hackathon2
//
//  Created by Anne Ferret on 11/12/2025.
//

import Foundation
import PhotosUI

@Observable
class ViewModel {
    // gestion d'erreurs et de temps de chargement
    var isLoading: Bool = false
    var errorMessage: String?
    var authorizationStatus: PHAuthorizationStatus = .notDetermined
    
    // image au hasard
    var randomImage: UIImage?
    
    // delais texte clic
    var isPresented: Bool = false
    
    // texte du cartel
    var cartelText: String = ""
    
    // screenshot
    var screenshot: UIImage?
    
    // fonctions
    
    func checkAuthorizationStatus() {
        authorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    }
    
    func requestPhotoLibraryAccess() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                self.authorizationStatus = status
            }
        }
    }
    
    func loadRandomPhoto() {
        isLoading = true
        errorMessage = nil
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        guard allPhotos.count > 0 else {
            errorMessage = "No photos found in library"
            isLoading = false
            return
        }
        
        let randomIndex = Int.random(in: 0..<allPhotos.count)
        let randomAsset = allPhotos.object(at: randomIndex)
        
        let imageManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .highQualityFormat
        
        imageManager.requestImage(
            for: randomAsset,
            targetSize: CGSize(width: 800, height: 800),
            contentMode: .aspectFit,
            options: requestOptions
        ) { image, info in
            DispatchQueue.main.async {
                if let image = image {
                    self.randomImage = image
                } else {
                    self.errorMessage = "Failed to load image"
                }
                self.isLoading = false
            }
        }
    }
}
