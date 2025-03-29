//
//  menuBarAppApp.swift
//  menuBarApp
//
//  Created by 박성민 on 3/13/25.
//

import SwiftUI

@main
struct menuBarAppApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
                .background(.clear)
        } label: {
            Image(systemName: "switch.2")   
        }
        .menuBarExtraStyle(.window)
    }
}
