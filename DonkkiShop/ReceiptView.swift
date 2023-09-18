//
//  ReceiptView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-09-18.
//

import SwiftUI

struct ReceiptView: View {
    @Binding var isActive: Bool
    var order: Order
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Order Receipt")
                Divider()
                ForEach(order.cart) { item in
                    HStack {
                        Text(item.donkki.name + " (" + String(item.amount) + "):")
                        Spacer()
                        Text("$" + String(format: "%.2f", order.itemTotal(item: item)))
                    }
                }
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text("$" + String(format: "%.2f", order.subtotal()))
                }
                Spacer().frame(height: 20)
                HStack {
                    Text("Shipping & Handling:")
                    Spacer()
                    Text("$" + String(format: "%.2f", order.shippingTotal()))
                }
                HStack {
                    Text("Total before tax:")
                    Spacer()
                    Text("$" + String(format: "%.2f", order.subShippingTotal()))
                }
                HStack {
                    Text("Estimated GST/HST:")
                    Spacer()
                    Text("$" + String(format: "%.2f", order.taxTotal()))
                }
                Spacer().frame(height: 20)
                HStack {
                    Text("Order Total:")
                        .foregroundColor(.primary)
                        .font(.headline)
                    Spacer()
                    Text("$" + String(format: "%.2f", order.orderTotal()))
                        .foregroundColor(.primary)
                        .font(.headline)
                }
            }
            .padding([.leading, .trailing], 20)
            Spacer() 
        }
        .padding([.top], -40)
    }
}
