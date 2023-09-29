//
//  Data.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import Foundation
import SwiftUI
import Combine

// This file is where your app stores all of its data (information)
// In SwiftUI, it's best to keep the data separate from the visual components of your app
// "Source of truth" - you only define a value in one place

// This structure provides the blueprint for your data
// It contains properties that define the name and type of data that the app stores
struct Donkki: Identifiable {
    let id = UUID()
    let name: String
    let price: Float
    let image: Image
}

struct Item: Identifiable {
    let id = UUID()
    let donkki: Donkki
    var amount: Int
}

struct Order: Identifiable {
    let id = UUID()
    let date: Date
    var cart: [Item]
    var amount: Int
    
    mutating func addItem(item: Donkki) {
        var exists = false
        for (index, element) in cart.enumerated() {
            if (element.donkki.name == item.name) {
                cart[index].amount += 1
                exists = true
            }
        }
        if (!exists) {
            cart.append(Item(donkki: item, amount: 1))
        }
        amount = countItems()
    }
    
    mutating func removeItem(item: Donkki) {
        for (index, element) in cart.enumerated() {
            if (element.donkki.name == item.name) {
                if (element.amount > 1) {
                    cart[index].amount -= 1
                } else {
                    cart.remove(at: index)
                }
            }
        }
    }
    
    func countItems() -> Int {
        var count = 0
        for item in cart {
            count += item.amount
        }
        return count
    }
    
    func itemTotal(item: Item) -> Float {
        return item.donkki.price * Float(item.amount)
    }
    
    func subtotal() -> Float {
        var cost = Float(0)
        for item in cart {
            cost += itemTotal(item: item)
        }
        return cost
    }
    
    func shippingTotal() -> Float {
        var cost = Float(0)
        for item in cart {
            cost += 0.5 * Float(item.amount)
        }
        return cost
    }
    
    func subShippingTotal() -> Float {
        return subtotal() + shippingTotal()
    }
    
    func taxTotal() -> Float {
        return subShippingTotal() * 0.13
    }
    
    func orderTotal() -> Float {
        return subShippingTotal() + taxTotal()
    }
}

class User: ObservableObject {
    @Published var curOrder = Order(date: Date(), cart: [Item](), amount: 0)
    @Published var orders = [Order]()
    let name = "Gavin Eugenio"
    let email = "gavin.eugenio@gmail.com"
    
    @Published var donkkiList = [
        Donkki(name: "Don", price: 1.99, image: Image("donkey")),
        Donkki(name: "Nikki", price: 2.99, image: Image("donkey")),
        Donkki(name: "Gavin", price: 3.99, image: Image("donkey")),
    ]
    
//    When wanting to update objects that are inside an object (curOrder is an object)
//    var anyCancellable: AnyCancellable? = nil
//    init() {
//        anyCancellable = curOrder.objectWillChange.sink { [weak self] (_) in
//            self?.objectWillChange.send()
//        }
//    }
    
    func addOrder() {
        orders.append(curOrder)
    }
    
    func newOrder() {
        // clears current order
        curOrder = Order(date: Date(), cart: [Item](), amount: 0)
    }
    
    func newDonkki(donkki: Donkki) {
        donkkiList.append(donkki)
    }
}
