//
//  ItemsModel.swift
//  Mvvm Sample
//
//  Created by Samuel Dalafiari on 28/01/2023.
//

import Foundation

struct Item: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var description: String

    static let exampleItem = Item(name: "Xbox", description: "Sample description")
}
