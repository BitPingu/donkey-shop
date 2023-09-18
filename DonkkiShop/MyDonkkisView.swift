//
//  MyDonkkisView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-09-12.
//

import SwiftUI

struct MyDonkkisView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            Text("My Orders")
                .foregroundColor(.primary)
                .font(.title)
                .bold()
            if user.orders.isEmpty {
                Spacer()
                Text("You have no orders.")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Spacer()
            } else {
                List(user.orders, id: \.self.id) { order in
                    NavigationLink(destination: OrderView(order: order)) {
                        OrderCard(order: order)
                    }
                }
                .padding([.bottom], 10)
            }
        }
        .padding([.top], -40)
    }
}
