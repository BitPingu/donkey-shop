//
//  StoryView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct AccountView: View {
    
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
                    Text("Gavin Eugenio")
                        .foregroundColor(.primary)
                        .font(.headline)
                    Text("gavin.eugenio@donkki.ca")
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
