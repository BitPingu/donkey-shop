//
//  CheckoutView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-08-22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var user: User
    @Binding var isActive: Bool
    
    var order: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                if !order {
                    Text("Shipping to: " + user.name)
                } else {
                    Text("Order Receipt")
                }
                Divider()
                ForEach(user.cart) { item in
                    HStack {
                        Text(item.donkki.name + " (" + String(item.amount) + "):")
                        Spacer()
                        Text("$" + String(format: "%.2f", user.itemTotal(item: item)))
                    }
                }
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.subtotal()))
                }
                Spacer().frame(height: 20)
                HStack {
                    Text("Shipping & Handling:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.shippingTotal()))
                }
                HStack {
                    Text("Total before tax:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.subShippingTotal()))
                }
                HStack {
                    Text("Estimated GST/HST:")
                    Spacer()
                    Text("$" + String(format: "%.2f", user.taxTotal()))
                }
                Spacer().frame(height: 20)
                HStack {
                    Text("Order Total:")
                        .foregroundColor(.primary)
                        .font(.headline)
                    Spacer()
                    Text("$" + String(format: "%.2f", user.orderTotal()))
                        .foregroundColor(.primary)
                        .font(.headline)
                }
            }
            .padding([.leading, .trailing], 20)
            Spacer()
            if !order {
                Button(action: {
                    print("order placed")
                    user.addOrder()
                    self.isActive.toggle()
                }, label: {
                    Text("Place your order")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
                .padding([.leading, .trailing, .bottom], 10)
            }
        }
        .padding([.top], -40)
    }
}
