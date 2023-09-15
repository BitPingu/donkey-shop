//
//  OrderView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-09-14.
//

import SwiftUI

struct OrderView: View {
    @State var receipt = false
    var order: Order
    
    var body: some View {
        VStack {
            order.amount == 1 ? Text(String(order.amount) + " item") : Text(String(order.amount) + " items")
                .foregroundColor(.primary)
                .font(.headline)
            List(order.items) { item in
                NavigationLink(destination: DonkkiView(donkki: item.donkki)) {
                    ItemCard(item: item, order: true)
                }
            }
            .padding()
            Spacer()
            Button(action: {
                print("view")
                receipt = true
            }, label: {
                Text("Order receipt")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .padding([.leading, .trailing, .bottom], 10)
            NavigationLink(destination: CheckoutView(isActive: $receipt, order: true), isActive: $receipt) { }
        }
        .padding([.top], -40)
    }
}

