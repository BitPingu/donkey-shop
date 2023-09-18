//
//  ItemCard.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-08-11.
//

import SwiftUI

struct ItemCard: View {
    @EnvironmentObject var user: User
    @State private var showAlert = false
    var item: Item
    var order: Bool
    
    var body: some View {
        HStack {
            if !order {
                VStack {
                    Image(systemName: "plus")
                        .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        .frame(width: 30, height: 30)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .onTapGesture {
                            user.curOrder.addItem(item: item.donkki)
                        }
                    Spacer().frame(height: 20)
                    if (item.amount == 1) {
                        Image(systemName: "trash")
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                            .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .onTapGesture {
                                showAlert = true
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Are you sure you want to remove " + item.donkki.name + " from your cart?"),
                                    primaryButton: .default(
                                        Text("Cancel")
                                    ),
                                    secondaryButton: .destructive(
                                        Text("Delete"),
                                        action: {
                                            user.curOrder.removeItem(item: item.donkki)
                                        }
                                    )
                                )
                            }
                    } else {
                        Image(systemName: "minus")
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                            .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .onTapGesture {
                                user.curOrder.removeItem(item: item.donkki)
                            }
                    }
                }
            }
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
