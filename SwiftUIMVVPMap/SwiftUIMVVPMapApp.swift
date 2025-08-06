//
//  SwiftUIMVVPMapApp.swift
//  SwiftUIMVVPMap
//
//  Created by Jesus Lara on 8/5/25.
//

import SwiftUI

@main
struct SwiftUIMVVPMapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
