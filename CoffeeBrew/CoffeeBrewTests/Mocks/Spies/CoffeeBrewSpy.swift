//
//  CoffeeBrewSpy.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import Foundation

class CoffeeBrewSpy<SpiedFunction: Spy.SpiedFunction>: Spy {

    private var storedParams: [SpiedFunction: Any?] = [:]
    private var functionLog: [SpiedFunction: Int] = [:]

    func record(functionName: String = #function, parameters: Any?) {
        guard let function = SpiedFunction(named: functionName) else {
            return
        }
        storedParams[function] = parameters

        functionLog[function] = {
            if let currentCount = functionLog[function] {
                return currentCount + 1
            } else {
                return 1
            }
        }()
    }

    func didCall(functionName: String) -> Bool {
        guard let function = SpiedFunction(named: functionName),
              let count = functionLog[function] else {
                  return false
              }
        return count > 0
    }

    func lastParams(for functionName: String) -> Any? {
        guard let function = SpiedFunction(named: functionName) else {
            return nil
        }
        return storedParams[function] as? Any
    }

}
