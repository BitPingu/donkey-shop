//
//  Data.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import Foundation
import SwiftUI

// This file is where your app stores all of its data (information)
// In SwiftUI, it's best to keep the data separate from the visual components of your app
// "Source of truth" - you only define a value in one place

// This structure provides the blueprint for your data
// It contains properties that define the name and type of data that the app stores
struct Donkki: Identifiable {
    let id = UUID()
    let name: String
    let price: Float
    let image: String
}

struct Item: Identifiable {
    let id = UUID()
    let donkki: Donkki
    var amount: Int
}

// This value, information, uses the Info structure to store all of the data used in your app
// You can refer to this global variable by its name from any file of the project
var donkkiList = [
    Donkki(name: "Don", price: 1.99, image: "donkey"),
    Donkki(name: "Nikki", price: 2.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey"),
]

class User: ObservableObject {
    @Published var cart = [Item]()
    
    func addItem(item: Donkki) {
        var exists = false
        for (index, element) in self.cart.enumerated() {
            if (element.donkki.name == item.name) {
                self.cart[index].amount += 1
                exists = true
            }
        }
        if (!exists) {
            self.cart.append(Item(donkki: item, amount: 1))
        }
    }
    
    func removeItem(item: Donkki) {
        for (index, element) in self.cart.enumerated() {
            if (element.donkki.name == item.name) {
                if (element.amount > 1) {
                    self.cart[index].amount -= 1
                } else {
                    self.cart.remove(at: index)
                }
            }
        }
    }
    
    func subtotal() -> Float {
        var cost = Float(0)
        for item in self.cart {
            cost += item.donkki.price * Float(item.amount)
        }
        return cost
    }
    
    func countItems() -> Int {
        var count = 0
        for item in self.cart {
            count += item.amount
        }
        return count
    }
}
