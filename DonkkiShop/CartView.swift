//
//  FavoritesView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var user: User
    @State private var action: Int? = 0
    var body: some View {
        VStack {
            HStack {
                Text("Subtotal: $" + String(format: "%.2f", user.subtotal()))
                    .foregroundColor(.primary)
                    .font(.headline)
                Spacer()
                user.countItems() == 1 ? Text(String(user.countItems()) + " item") : Text(String(user.countItems()) + " items")
                    .foregroundColor(.primary)
                    .font(.headline)
            }
            .padding([.leading, .trailing], 10)
            if user.cart.isEmpty {
                Spacer()
                Text("Your cart is empty.")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Spacer()
            } else {
                List(user.cart) { item in
                    NavigationLink(destination: DonkkiView(donkki: item.donkki)) {
                        ItemCard(item: item)
                    }
                }
            }
            Button(action: {
                print("checkout")
            }, label: {
                Text("Checkout")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .padding([.leading, .trailing, .bottom], 10)
        }
    }
    
}
