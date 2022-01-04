//
//  CoffeeBrewFakeDataService+CoffeeBrewSession.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import Foundation
@testable import CoffeeBrew

extension CoffeeBrewFakeDataService: CoffeeBrewSession {

    func loadCoffeeStyleListData(withID id: String, completion: @escaping Handler<CoffeeStyleItem>) {
        complete(request: .loadCoffeeStyleListData, with: completion)
    }

}
