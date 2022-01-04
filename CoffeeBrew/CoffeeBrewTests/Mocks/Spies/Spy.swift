//
//  Spy.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import Foundation

protocol Spy {

    typealias SpiedFunction = Hashable & Nameable

    func record(functionName: String, parameters: Any?)

    func didCall(functionName: String) -> Bool

    func lastParams(for functionName: String) -> Any?
}
