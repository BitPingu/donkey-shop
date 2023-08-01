//
//  GridView.swift
//  DonkkiShop
//
//  Created by Gavin on 2023-07-27.
//

import SwiftUI

struct GridView: View {
    
    // columnLayout specifies a three-column grid
    let columnLayout = Array(repeating: GridItem(), count: 3)
    
    // Add @State before a variable to tell SwiftUI to manage the storage for a value
    // When the value changes, SwiftUI updates any parts of the view that use the value
    // The state variable selectedColor tracks the most recently selected color
    @State private var selectedColor = Color.gray
    
    // Store an array of color values
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    
    var body: some View {
        // VStack view arranges its views vertically
        VStack {
            // Put text above grid
            // Uses selectedColor for its foregroundColor - because selectedColor is a state variable, whenever the state changes, SwiftUI changes the color of this text
            Text("Selected Color")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(selectedColor)
                .padding(10)
            
            // ScrollView allows the grid to contain more items than it can display at a time - makes the content vertically scrollable
            ScrollView {
                // LazyVGrid creates a grid - "lazy" means it doesn't create its grid items until they are needed
                // Takes an argument for columns which determines how many columns show up in the grid
                LazyVGrid(columns: columnLayout) {
                    // Define each item for the grid to display
                    // ForEach iterates over all the allColors array - by using the color's name as an identifier, it can find the right element when it needs to update the color's view
                    ForEach(allColors, id: \.description) { color in
                        // Each item in the grid is a Button view, and each button has an action (something that happens when you tap it) and a label
                        Button {
                            // When you tap a grid element, the selectedColor value changes to that element's color, which changes the color of the text
                            selectedColor = color
                        } label: {
                            // Label uses a RoundedRectangle view, and one of the colors from the ForEach loop
                            RoundedRectangle(cornerRadius: 4.0).aspectRatio(1.0, contentMode: ContentMode.fit).foregroundColor(color)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding(10)
    }
    
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
