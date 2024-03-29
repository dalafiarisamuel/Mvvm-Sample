//
//  Content-ViewModel.swift
//  Mvvm Sample
//
//  Created by Samuel Dalafiari on 28/01/2023.
//

import Foundation
import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isTurnedOn: Bool = false
        @Published var counter: Int = 0
        @Published var itemList: [Item] = [Item]()
        private let randomItemNames = ["Playstation", "Xbox", "Nintendo Wii", "Nintendo Switch", "Gameboy"]

        func increment() {
            counter += 1
        }

        func addItem() {
            let itemName = randomItemNames.randomElement()!
            let randomItem = Item(name: itemName, description: "Item: \(itemList.count + 1)")

            withAnimation {
                itemList.insert(randomItem, at: 0)
            }
        }
        
        func deleteItem(item: Item){
            withAnimation {
                let index = itemList.firstIndex(of: item)
                itemList.remove(at: index!)
            }
        }
    }
}
