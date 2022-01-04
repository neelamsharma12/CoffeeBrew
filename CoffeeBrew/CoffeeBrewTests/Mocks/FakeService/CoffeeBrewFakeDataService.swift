//
//  CoffeeBrewFakeDataService.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import UIKit
@testable import CoffeeBrew

class CoffeeBrewFakeDataService {

    typealias RequestResult = Result<Any, Error>

    enum Request: Hashable {
        case loadCoffeeStyleListData
    }

    /// Holds the relationship between Request and its associated result.
    var results: [Request: RequestResult]

    convenience init() {
        self.init(with: [:])
    }

    init(with resultConfiguration: [Request: RequestResult]) {
        self.results = resultConfiguration
    }

    func configure(request: Request, result: RequestResult?) {
        self.results[request] = result
    }

}

extension CoffeeBrewFakeDataService {

    private static let fakeError: Error = NSError(domain: "Fake data service error", code: -1, userInfo: nil)

    private func getResult<T>(for request: Request) -> Result<T, Error> {
        guard let result = results[request] else {
            return .failure(Self.fakeError)
        }
        switch result {
        case .success(let response as T):
            return .success(response)
        case .failure(let error):
            return .failure(error)
        default:
            return .failure(Self.fakeError)
        }
    }

    func complete<T>(request: Request, with completion: Handler<T>) {
        let result: Result<T, Error> = getResult(for: request)
        completion(result)
    }

    func complete(request: Request, with completion: (Error?) -> Void) {
        let result: Result<Any, Error> = getResult(for: request)
        switch result {
        case .success:
            completion(nil)
        case .failure(let error):
            completion(error)
        }
    }

}
