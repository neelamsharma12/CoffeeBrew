//
//  CoffeeStyleItem.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

/// This is the data model for coffee style items
public struct CoffeeStyleItem {

    let types: [CoffeeTypes]

}

extension CoffeeStyleItem: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case types
    }

}

/// This is the data model for CoffeeTypes
public struct CoffeeTypes {
    
    let coffeeId: String
    let name: String
    let sizes: [String]
    let extras: [String]

}

extension CoffeeTypes: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case coffeeId = "_id"
        case name, sizes, extras
    }

}
