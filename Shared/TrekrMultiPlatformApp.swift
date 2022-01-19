//
//  TrekrMultiPlatformApp.swift
//  Shared
//
//  Created by Harris-Stoertz, Rowan on 2022-01-18.
//

import SwiftUI

@main
struct TrekrMultiPlatformApp: App {
    
    @StateObject var store = LocationStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LocationsList(store: store)
            }
        }
    }
}
