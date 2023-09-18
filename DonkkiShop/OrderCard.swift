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
            VStack(alignment: .leading, spacing: 3) {
                Text("Order # " + String(order.id.uuidString.hashValue))
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

