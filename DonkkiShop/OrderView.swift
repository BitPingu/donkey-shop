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
            Text("Order # " + String(order.id.uuidString.hashValue))
                .foregroundColor(.primary)
                .font(.title2)
                .bold()
            List(order.cart) { item in
                NavigationLink(destination: DonkkiView(donkki: item.donkki)) {
                    ItemCard(item: item, order: true)
                }
            }
            Spacer()
            Button(action: {
                receipt = true
            }, label: {
                Text("Order receipt")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .padding([.leading, .trailing, .bottom], 10)
            NavigationLink(destination: ReceiptView(isActive: $receipt, order: order), isActive: $receipt) { }
        }
        .padding([.top], -40)
    }
}

