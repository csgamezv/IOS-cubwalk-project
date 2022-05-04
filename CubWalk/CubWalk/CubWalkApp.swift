//
//  CubWalkApp.swift
//  CubWalk
//
//  Created by Cesar Gamez on 4/28/22.
//

import SwiftUI
import Firebase

@main
struct CubWalkApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
