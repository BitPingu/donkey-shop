//
//  FunFactsView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI
import AlertToast

struct HelpView: View {
    @State var request = false
    @State var requestMade = false
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: GridView()) {
                HelpCard(text: "I have a problem with my Donkki")
            }
            Divider()
            NavigationLink(destination: NewDonkkiView(isActive: $request, checkRequest: $requestMade), isActive: $request) {
                HelpCard(text: "Request a new Donkki")
            }
            Divider()
            NavigationLink(destination: GridView()) {
                HelpCard(text: "My tickets")
            }
        }
        .toast(isPresenting: $requestMade, duration: 2, tapToDismiss: false) {
            AlertToast(type: .regular,
                       title: "Order placed!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(20)
    }
}
