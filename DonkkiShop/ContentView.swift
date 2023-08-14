//
//  ContentView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-24.
//

import SwiftUI

class TabMonitor: ObservableObject {
    @Published var selectedTab = 1
}

// ContentView is a View - it can contain any number of other views inside of it
struct ContentView: View {
    
    // Define any variables that ContentView needs outside of body
    @EnvironmentObject var user: User
    @StateObject private var tabMonitor = TabMonitor()
    
    // Any code that defines a view is in the view's body
    var body: some View {
        // TabView is how you create a user interface with tabs
        // Inside the tab view, you list each of the tab items you want
        TabView(selection: $tabMonitor.selectedTab) {
            // To make a tab, create an instance of the view you want to display when someone taps a tab
            // The first tab view in the list is HomeView, so it's the first tab you see
            TabbedNavView(tag: 1) {
                HomeView().navigationTitle("Donkki Shop")
            }
            .tabItem { Label("Home", systemImage: "house") }
            .tag(1)
            TabbedNavView(tag: 2) {
                AccountView().navigationTitle("My Account")
            }
            .tabItem { Label("Account", systemImage: "person") }
            .tag(2)
            TabbedNavView(tag: 3) {
                CartView().navigationTitle("My Shopping Cart")
            }
            .tabItem { Label("Cart", systemImage: "cart") }
            .tag(3)
            TabbedNavView(tag: 4) {
                HelpView().navigationTitle("Support")
            }
            .tabItem { Label("Help", systemImage: "questionmark.circle") }
            .tag(4)
        }
        .environmentObject(tabMonitor)
    }
    
}

struct TabbedNavView: View {
    @EnvironmentObject var tabMonitor: TabMonitor
    
    private var tag: Int
    private var content: AnyView
    
    init(
        tag: Int,
        @ViewBuilder _ content: () -> any View
    ) {
        self.tag = tag
        self.content = AnyView(content())
    }
    
    @State private var id = 1
    @State private var selected = false
    
    var body: some View {
        NavigationView {
            content
                .id(id)
                .onReceive(tabMonitor.$selectedTab) { selection in
                    if selection != tag {
                        selected = false
                    } else {
                        if selected {
                            id *= -1
                        }
                        selected = true
                    }
                }
        }
    }
}
