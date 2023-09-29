//
//  NewDonkkiView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-09-19.
//

import SwiftUI
import PhotosUI
import AlertToast
import UIKit
import Combine

struct NewDonkkiView: View {
    @EnvironmentObject var user: User
    
    @Binding var isActive: Bool
    @Binding var checkRequest: Bool
    
    @State var newName = ""
    @State var newPrice = ""
    
    var enteredNumberFormatted: Double {
        return (Double(newPrice) ?? 0) / 100
    }
    
    @State var selectedImages: [PhotosPickerItem] = []
    @State var imageData: Data?
    @State var newImage = UIImage(named: "donkey")
    
    @State private var validateName = true
    @State private var inputName = false
    @State private var validatePrice = true
    @State private var inputPrice = false
    
    @State private var showAlert = false
    @State private var buttonDelay = false
    
    let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("New Donkki")
                .foregroundColor(.primary)
                .font(.title)
                .bold()
            Form {
                Section(
                    header: Text("Name"),
                    footer: HStack {
                        if (!validateName && !inputName) {
                            Text("Enter a name").foregroundStyle(.red)
                        }
                    }
                ) {
                    TextField("Enter Donkki Name", text: $newName)
                        .onChange(of: newName) { [newName] newValue in
                            inputName = true
                        }
                }
                Section(
                    header: Text("Price"),
                    footer: HStack {
                        if (!validatePrice && !inputPrice) {
                            Text("Enter a price").foregroundStyle(.red)
                        }
                    }
                ) {
                    ZStack(alignment: .leading) {
                        TextField("Enter Donkki Price", text: $newPrice)
                            .keyboardType(.numberPad)
                            .onReceive(Just(newPrice)) { newVal in
                                let filtered = newVal.filter { "0123456789.".contains($0) }
                                if filtered != newVal {
                                    newPrice = filtered
                                }
                            }
//                        Text("\(enteredNumberFormatted, specifier: "$ %.2f")")
                    }
                }
                
                Section(header: Text("Image")) {
                    Image(uiImage: newImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90.0, height: 90.0)
                    PhotosPicker(
                        selection: $selectedImages,
                        maxSelectionCount: 1,
                        matching: .images
                    ) {
                        Text("Choose image")
                    }
                    .onChange(of: selectedImages) { newValue in
                        guard let item = selectedImages.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                                case .success(let data):
                                    if let data = data {
                                        imageData = data
                                        newImage = UIImage(data: imageData!)
                                    } else {
                                        print("Data is nil")
                                    }
                                case .failure(let failure):
                                    fatalError("\(failure)")
                            }
                        }
                    }
                }
                
            }
            Spacer()
            Button(action: {
                if newName.isEmpty {
                    validateName = false
                    inputName = false
                } else {
                    validateName = true
                }
                if newPrice.isEmpty {
                    validatePrice = false
                    inputPrice = false
                } else {
                    validatePrice = true
                }
                if !validateName || !validatePrice {
                    showAlert.toggle()
                    buttonDelay = true
                    DispatchQueue.global(qos: .background).async {
                        sleep(2)
                        DispatchQueue.main.async {
                            buttonDelay = false
                        }
                    }
                } else {
                    print("Name: " + newName + " | Price: " + newPrice)
                    user.newDonkki(donkki: Donkki(name: newName, price: Float(newPrice)!, image: Image(uiImage: newImage!)))
                    checkRequest = true
                    self.isActive.toggle()
                }
            }, label: {
                Text("Add Donkki")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .padding([.leading, .trailing, .bottom], 10)
        }
        .toast(isPresenting: $showAlert, duration: 2, tapToDismiss: false) {
            AlertToast(type: .regular,
                       title: "There are invalid entries!")
        }
        .padding([.top], -40)
    }
}
