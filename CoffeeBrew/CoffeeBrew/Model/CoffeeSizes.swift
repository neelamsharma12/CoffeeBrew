//
//  CoffeeSize.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

/// This is the data model for coffee sizes
public struct CoffeeSizes {

    let sizes: [CoffeeSize]

}

extension CoffeeSizes: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case sizes
    }

}

/// This is the data model for coffee size
public struct CoffeeSize {

    let id: String
    let name: String

}

extension CoffeeSize: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }

}

