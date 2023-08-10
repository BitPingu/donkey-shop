//
//  FunFactsView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: GridView()) {
                HelpCard(text: "I have a problem with my Donkki")
            }
            Divider()
            NavigationLink(destination: GridView()) {
                HelpCard(text: "Request a new Donkki")
            }
            Divider()
            NavigationLink(destination: GridView()) {
                HelpCard(text: "My tickets")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(20)
        .navigationTitle("Support")
    }
}
