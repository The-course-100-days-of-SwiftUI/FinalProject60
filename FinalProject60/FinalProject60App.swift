//
//  FinalProject60App.swift
//  FinalProject60
//
//  Created by Margarita Mayer on 21/01/24.
//

import SwiftUI

@main
struct FinalProject60App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
