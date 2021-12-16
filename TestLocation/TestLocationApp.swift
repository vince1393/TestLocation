//
//  TestLocationApp.swift
//  TestLocation
//
//  Created by Vincent Romani on 2021-12-15.
//

import SwiftUI

@main
struct TestLocationApp: App {
    @ObservedObject var manager = LocationManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(locations: manager.locations)
        }
    }
}
