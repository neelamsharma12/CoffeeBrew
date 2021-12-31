//
//  CoffeeBrewSession.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

/// This protocol provides the CoffeeBrew Session
protocol CoffeeBrewSessionProviding {
    var coffeeBrewSession: CoffeeBrewSession { get }
}

/// Requirements for 'CoffeeBrewSession'
protocol CoffeeBrewSession {

    typealias Handler<Response> = (Result<Response, Error>) -> Void

    // MARK: - Get Requests

    /// API fo fetch the coffee styles
    /// Parameters:
    ///  - completion: Handles the response
    func loadCoffeeStyleListData(withID id: String, completion: @escaping Handler<CoffeeStyleItem>)
}
