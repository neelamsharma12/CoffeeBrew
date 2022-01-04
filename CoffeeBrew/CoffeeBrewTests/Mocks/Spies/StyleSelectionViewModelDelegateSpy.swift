//
//  CoffeeStyleViewModelDelegateSpy.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import Foundation

@testable import CoffeeBrew

final class StyleSelectionViewModelDelegateSpy: CoffeeBrewSpy<StyleSelectionViewModelDelegateSpy.Function>, StyleSelectionViewModelDelegate {
    

    enum Function: String, Spy.SpiedFunction {
        case didLoadCoffeeStyleList
        case didFailLoadingCoffeeStyleList
    }

    func didLoadCoffeeStyleList(coffeeStyleListData: CoffeeStyleItem) {
        record(parameters: coffeeStyleListData)
    }
    
    func didFailLoadingCoffeeStyleList(_ error: Error) {
        record(parameters: error)
    }

}
