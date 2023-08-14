//
//  ItemCard.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-08-11.
//

import SwiftUI

struct ItemCard: View {
    var item: Item
    
    var body: some View {
        HStack {
            Image(item.donkki.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90.0, height: 90.0)
            VStack(alignment: .leading, spacing: 3) {
                Text(item.donkki.name + " (" + String(item.amount) + ")")
                    .foregroundColor(.primary)
                    .font(.headline)
                Text("$" + String(item.donkki.price))
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}
