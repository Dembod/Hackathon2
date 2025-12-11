//
//  Hackathon2App.swift
//  Hackathon2
//
//  Created by Dembo on 11/12/2025.
//

import SwiftUI
import Photos

@main
struct testApp: App {
    @State var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            if vm.authorizationStatus == .authorized || vm.authorizationStatus == .limited {
                ImageGalleryView().environment(vm)
            } else {
                AuthorizationView().environment(vm)
            }
        }
    }
}
