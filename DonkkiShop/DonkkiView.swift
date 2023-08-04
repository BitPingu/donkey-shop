//
//  DonkkiView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-28.
//

import SwiftUI
import AlertToast

struct DonkkiView: View {
    @EnvironmentObject var user: User
    var donkki: Donkki
    
    @State private var showAlert = false
    @State private var buttonDelay = false
    
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
                    user.cart.append(donkki)
                    showAlert.toggle()
                    buttonDelay = true
                    DispatchQueue.global(qos: .background).async {
                        sleep(2)
                        DispatchQueue.main.async {
                            buttonDelay = false
                        }
                    }
                }
                .buttonStyle(.bordered)
                .disabled(buttonDelay == true)
            }
            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .toast(isPresenting: $showAlert, duration: 2, tapToDismiss: false) {
            AlertToast(type: .regular,
                       title: "1 " + donkki.name + " has been added to your cart.")
        }
    }
}
