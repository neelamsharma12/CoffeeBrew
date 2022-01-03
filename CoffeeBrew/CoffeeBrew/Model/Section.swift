//
//  Section.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 02/01/22.
//

import Foundation

// MARK: - Section Data Structure

public struct Item {

    var name: String
    var detail: String

    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }

}

public struct Section {

    var name: String
    var items: [Item]
    var collapsed: Bool

    public init(name: String, items: [Item], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }

}
