//
//  Extras.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

/// This is the data model for Extras
public struct Extras {

    let id: String
    let name: String
    let subselections: [Subselections]

}

extension Extras: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case subselections
    }

}

/// This is the data model for Subselections
public struct Subselections {

    let id: String
    let name: String

}

extension Subselections: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }

}

