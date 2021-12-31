//
//  ApplicationHost.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

class ApplicationHost: CoffeeBrewSessionProviding {
    var coffeeBrewSession: CoffeeBrewSession {
        CoffeeBrewDataService()
    }
}
