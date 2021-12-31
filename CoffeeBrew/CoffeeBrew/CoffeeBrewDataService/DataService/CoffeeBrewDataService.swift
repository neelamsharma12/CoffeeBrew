//
//  CoffeeBrewDataService.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

struct CoffeeBrewDataService {
    internal var session: URLSession { URLSession.shared }
}

extension CoffeeBrewDataService: CoffeeBrewSession {
    
    func loadCoffeeStyleListData(withID coffeeId: String, completion: @escaping Handler<CoffeeStyleItem>) {
        makeRequest(CoffeeStyleItem.self, id: coffeeId, completion: { result in
            completion(result)
        })
    }
    
}
