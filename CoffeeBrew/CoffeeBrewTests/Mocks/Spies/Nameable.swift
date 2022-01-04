//
//  Nameable.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import Foundation

protocol Nameable: RawRepresentable {

    init?(named name: String)

}

extension Nameable where RawValue == String {

    init?(named name: String) {
        guard let nameable: Self = {
            if let cleanName = Self(rawValue: name) {
                return cleanName
            } else if let index = name.firstIndex(of: "(") {
                let functionName = name.prefix(upTo: index)
                return Self(rawValue: String(functionName))
            } else {
                return nil
            }
        }() else { return nil}

        self = nameable
    }

}
