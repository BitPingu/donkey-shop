//
//  StoryView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("donkey")
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90.0, height: 90.0)
                VStack(alignment: .leading, spacing: 3) {
                    Text(user.name)
                        .foregroundColor(.primary)
                        .font(.headline)
                    Text(user.email)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
            VStack(alignment: .leading) {
                NavigationLink(destination: GridView()) {
                    HelpCard(text: "My Donkkis")
                }
                Divider()
                NavigationLink(destination: GridView()) {
                    HelpCard(text: "Pending Donkkis")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(20)
    }
    
}
