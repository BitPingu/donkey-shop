//
//  DonkkiShopApp.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-24.
//

import SwiftUI

@main // Mark as entry point of the program - the code the app starts running first
struct DonkkiShopApp: App {
    // Follow a set of guidelines created by the App protocol - allows project to run and behave like any app
    // When app runs, display whatever content is placed in "body"
    @StateObject var user = User()
    var body: some Scene {
        WindowGroup {
            // Fill screen with "ContentView" - configured as top-level view by default - go to ContentView to see how the app's views are put together
            ContentView().environmentObject(user)
        }
    }
}
