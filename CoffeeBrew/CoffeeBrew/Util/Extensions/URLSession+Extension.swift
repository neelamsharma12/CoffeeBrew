//
//  URLSession+Extension.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

extension URLSession {

    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(
        _ endpoint: Endpoint,
        then handler: @escaping Handler
    ) -> URLSessionDataTask {
        let task = dataTask(
            with: endpoint.url,
            completionHandler: handler
        )

        task.resume()
        return task
    }
}
