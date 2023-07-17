//
//  CitysightApp.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 22/06/2023.
//

import SwiftUI

@main
struct CitysightApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
            .environmentObject(ContentModel())
        }
    }
}
