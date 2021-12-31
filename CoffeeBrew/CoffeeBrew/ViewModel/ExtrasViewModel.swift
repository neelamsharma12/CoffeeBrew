//
//  ExtrasViewModel.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import Foundation

/// This class contains business logic for Extras Selection viewcontroller class
final class ExtrasViewModel {

    var styleSelectionImages = ["Select the amount of sugar": "milk", "Select type of milk": "cappuchino"]

    func getExtrasList(_ coffeeTypes: CoffeeTypes?, coffeeStyles: CoffeeStyleItem?) -> [String] {
        var extrasList = [String]()
        if let extras = coffeeTypes?.extras, let extrasDict = convertCoffeeExtrasIntoDict(coffeeStyles?.extras) {
            for id in extras {
                if let name = extrasDict[id] {
                    for key in name.keys {
                        if !extrasList.contains(key) {
                            extrasList.append(key)
                        }
                    }
                }
            }
        }
        return extrasList
    }
   
    private func convertCoffeeExtrasIntoDict(_ extras: [Extras]?) -> [String: [String: [Subselections]]]? {
        guard let extras = extras else {
            return nil
        }
        var extrasDict = [String: [String: [Subselections]]]()
        for item in extras {
            extrasDict[item.id] = [item.name: item.subselections]
        }
        return extrasDict
    }
}
