//
//  CoffeeBrewViewModel.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import Foundation

protocol StyleSelectionViewModelDelegate: AnyObject {
    func didLoadCoffeeStyleList(coffeeStyleListData: CoffeeStyleItem)
    func didFailLoadingCoffeeStyleList(_ error: Error)
}

/// This class contains business logic for Style Selection viewcontroller class
final class StyleSelectionViewModel {
    
    private var session: CoffeeBrewSession
    private weak var delegate: StyleSelectionViewModelDelegate?
    var styleSelectionList: CoffeeStyleItem?
    var styleselectionImages = ["Espresso": "espresso", "Cappuccino": "cappuchino", "Lungo": "large"]

    init(sessionProvider: CoffeeBrewSession, delegate: StyleSelectionViewModelDelegate? = nil) {
        self.session = sessionProvider
        self.delegate = delegate
    }

    func getCoffeeStyleList() {
        session.loadCoffeeStyleListData(withID: "60ba1ab72e35f2d9c786c610") { result in
            switch result {
            case .success(let coffeeStyleList):
                self.styleSelectionList = coffeeStyleList
                self.delegate?.didLoadCoffeeStyleList(coffeeStyleListData: coffeeStyleList)
            case .failure(let error):
                self.delegate?.didFailLoadingCoffeeStyleList(error)
            }
        }
    }
   
}
