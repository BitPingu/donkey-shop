//
//  ContentView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-24.
//

import SwiftUI

// ContentView is a View - it can contain any number of other views inside of it
struct ContentView: View {
    
    // Define any variables that ContentView needs outside of body
    
    // Any code that defines a view is in the view's body
    var body: some View {
        // TabView is how you create a user interface with tabs
        // Inside the tab view, you list each of the tab items you want
        TabView {
            // To make a tab, create an instance of the view you want to display when someone taps a tab
            // The first tab view in the list is HomeView, so it's the first tab you see
            NavigationStack {
                HomeView().navigationTitle("Donkki Shop")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack {
                AccountView().navigationTitle("My Account")
            }
            .tabItem {
                Label("Account", systemImage: "person")
            }
            NavigationStack {
                CartView().navigationTitle("My Shopping Cart")
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            NavigationStack {
                HelpView().navigationTitle("Support")
            }
            .tabItem {
                Label("Help", systemImage: "questionmark.circle")
            }
        }
    }
    
}
