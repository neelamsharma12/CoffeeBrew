//
//  Endpoint.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

struct Endpoint {

    var path: String
    var queryItems: [URLQueryItem] = []

}

extension Endpoint {

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "darkroastedbeans.coffeeit.nl"
        components.path =  path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }

}

extension Endpoint {

    static func loadCoffeeStyleList(withID id: String) -> Self {
        Endpoint(path: "/coffee-machine/\(id)")
    }

}
