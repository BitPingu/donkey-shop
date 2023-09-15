//
//  OrderCard.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-09-13.
//

import SwiftUI

struct OrderCard: View {
    @EnvironmentObject var user: User
    var order: Order
    let dateFormatter = DateFormatter()
    
    var body: some View {
        HStack {
            Image(order.items[0].donkki.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90.0, height: 90.0)
            VStack(alignment: .leading, spacing: 3) {
                order.amount == 1 ? Text(String(order.amount) + " item") : Text(String(order.amount) + " items")
                    .foregroundColor(.primary)
                    .font(.headline)
                let _ = dateFormatter.dateFormat = "MMM d, y"
                Text("Order placed on " + dateFormatter.string(from: order.date))
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

