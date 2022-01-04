//
//  CoffeeStyleItem.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

/// This is the data model for coffee style items
public struct CoffeeStyleItem {

    let types: [CoffeeType]
    let sizes: [CoffeeSizes]
    let extras: [Extras]

}

extension CoffeeStyleItem: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case types, sizes, extras
    }

}

/// This is the data model for CoffeeTypes
public struct CoffeeType {
    
    let coffeeId: String
    let name: String
    let sizes: [String]
    let extras: [String]

}

extension CoffeeType: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case coffeeId = "_id"
        case name, sizes, extras
    }

}
