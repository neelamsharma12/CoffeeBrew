//
//  CoffeeBrewDataService+makeRequest.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import UIKit

extension CoffeeBrewDataService {
    
    func makeRequest<T: Decodable>(_ model: T.Type, id: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        session.request(.loadCoffeeStyleList(withID: id)) { (data, _, error)  in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let result = Result { try JSONDecoder().decode(T.self, from: data) }
                completion(result)
            }
        }
    }
    
}
