//
//  DonkkiCard.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-28.
//

import SwiftUI

struct DonkkiCard: View {
    var donkki: Donkki
    
    var body: some View {
        HStack {
            donkki.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90.0, height: 90.0)
            VStack(alignment: .leading, spacing: 3) {
                Text(donkki.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text(String(format: "$%.2f", donkki.price))
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}
