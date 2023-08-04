//
//  FavoritesView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        if user.cart.isEmpty {
            Text("Your cart is empty.")
                .foregroundColor(.secondary)
                .font(.subheadline)
        } else {
            Text(String(user.cart.count) + " Items")
                .foregroundColor(.primary)
                .font(.headline)
            List(user.cart) { donkki in
                NavigationLink(destination: DonkkiView(donkki: donkki)) {
                    DonkkiCard(donkki: donkki)
                }
            }
        }
    }
    
}
