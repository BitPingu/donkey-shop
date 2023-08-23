//
//  FavoritesView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI
import AlertToast

struct CartView: View {
    @EnvironmentObject var user: User
    @State var checkout = false
    
    @State private var showAlert = false
    @State private var buttonDelay = false
    
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
                if (user.cart.isEmpty) {
                    showAlert.toggle()
                    buttonDelay = true
                    DispatchQueue.global(qos: .background).async {
                        sleep(2)
                        DispatchQueue.main.async {
                            buttonDelay = false
                        }
                    }
                } else {
                    checkout = true
                }
            }, label: {
                Text("Checkout")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .padding([.leading, .trailing, .bottom], 10)
            .disabled(buttonDelay == true)
            NavigationLink(destination: CheckoutView(), isActive: $checkout) { }
        }
        .toast(isPresenting: $showAlert, duration: 2, tapToDismiss: false) {
            AlertToast(type: .regular,
                       title: "There are no items in your cart!")
        }
    }
    
}
