//
//  ExtrasViewModel.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import Foundation

/// This class contains business logic for Extras Selection viewcontroller class
final class ExtrasSelectionViewModel {

    var extrasSelectionImages = ["Select the amount of sugar": "cappuchino", "Select type of milk": "milk"]

    func getExtrasList(_ coffeeType: CoffeeType?, coffeeStyles: CoffeeStyleItem?) -> [[String: [String]]] {
        var extrasWithValues = [[String: [String]]]()
        if let extras = coffeeType?.extras, let extrasDict = convertCoffeeExtrasIntoDict(coffeeStyles?.extras) {
            for id in extras {
                if let name = extrasDict[id] {
                    extrasWithValues += convertExtraArrayIntoDictionary(extras: name)
                }
            }
        }
        return extrasWithValues
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

    private func convertExtraArrayIntoDictionary(extras: [String: [Subselections]]) -> [[String: [String]]] {
        var extrasDict = [[String: [String]]]()
        
        for extra in extras {
            var extraValues = [String]()
            for value in extra.value {
                extraValues.append(value.name)
            }
            extrasDict.append([extra.key: extraValues])
        }
        return extrasDict
    }

    func getSections(_ extrasList: [[String: [String]]]) -> [Section]? {
        var sectionsData = [Section]()
        for item in extrasList {
            guard let name = item.keys.first else {
                return nil
            }
            var itemList = [Item]()
            for extraValue in item.values {
                for value in extraValue {
                    let item = Item(name: value, detail: "")
                    itemList.append(item)
                }
            }
            let section = Section(name: name, items: itemList, collapsed: true)
            sectionsData.append(section)
        }
        return sectionsData
    }
}
