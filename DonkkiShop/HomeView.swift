//
//  HomeView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        List(user.donkkiList) { donkki in
            NavigationLink(destination: DonkkiView(donkki: donkki)) {
                DonkkiCard(donkki: donkki)
            }
        }
        .listStyle(.plain)
    }
}
