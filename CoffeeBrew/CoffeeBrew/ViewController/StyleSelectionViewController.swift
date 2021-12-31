//
//  StyleSelectionViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import UIKit

/// This class is used to select the coffee style
class StyleSelectionViewController: UIViewController {

    // MARK: - variable declaration
    private var viewModel: CoffeeBrewViewModel?

    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CoffeeBrewViewModel(sessionProvider: ApplicationHost.init().coffeeBrewSession, delegate: self)
        viewModel?.getCoffeeStyleList()
        navigationItem.hidesBackButton = true
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
    }
    
}

extension StyleSelectionViewController: CoffeeBrewViewModelDelegate {

    func didLoadCoffeeStyleList(coffeeStyleListData: CoffeeStyleItem) {
        debugPrint(coffeeStyleListData)
    }
    
    func didFailLoadingCoffeeStyleList(_ error: Error) {
        debugPrint(error)
    }
    
}
