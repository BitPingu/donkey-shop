//
//  DonkkiView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-28.
//

import SwiftUI

struct DonkkiView: View {
    var donkki: Donkki
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(donkki.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 400.0)
                .background(Color.gray.opacity(0.1))
            VStack(alignment: .leading) {
                Text(donkki.name)
                    .foregroundColor(.primary)
                    .font(.title)
                Text("$" + String(donkki.price))
                    .foregroundColor(.secondary)
                    .font(.title2)
                Spacer().frame(height: 20)
                Button("Add to Cart") {
                    print("test")
                }
                .buttonStyle(.bordered)
            }
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
