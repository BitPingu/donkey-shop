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
struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

struct Donkki: Identifiable {
    let id = UUID()
    var name: String
    var price: Float
    let image: String
}

// This value, information, uses the Info structure to store all of the data used in your app
// You can refer to this global variable by its name from any file of the project
let information = Info(
    image: "donkey",
    name: "DonGkki",
    story: "A story can be about anything you can dream up. There are no right answers, there is no one else.",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["croissont", "taco", "sushi"],
    colors: [Color.blue, Color.purple, Color.pink],
    funFacts: [
        "The femur",
        "The moon",
        "Prince",
        "503",
        "Ice",
        "You can spell",
        "A collection",
        "White"
    ]
)

var donkkiList = [
    Donkki(name: "Don", price: 1.99, image: "donkey"),
    Donkki(name: "Nikki", price: 2.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey"),
    Donkki(name: "Gavin", price: 3.99, image: "donkey")
]

class User: ObservableObject {
    @Published var cart: [Donkki]
    
    init(cart: [Donkki]) {
        self.cart = cart
    }
}
