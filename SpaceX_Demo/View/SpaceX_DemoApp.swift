//
//  SpaceX_DemoApp.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 29/01/21.
//

import SwiftUI

@main
struct SpaceX_DemoApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            RocketView()
        }
    }
}
