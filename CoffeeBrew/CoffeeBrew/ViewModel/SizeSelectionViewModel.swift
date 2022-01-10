//
//  SizeViewModel.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import Foundation

/// This class contains business logic for Size Selection viewcontroller class
final class SizeSelectionViewModel {

    var sizeSelectionImages = ["Large": "large", "Venti": "small", "Tall": "medium"]

    func getSizeList(_ coffeeType: CoffeeType?, coffeeStyles: CoffeeStyleItem?) -> [String] {
        var coffeeSizes = [String]()
        if let sizes = coffeeType?.sizes, let coffeeSizeDict = convertCoffeeSizesIntoDict(coffeeStyles?.sizes) {
            for id in sizes {
                if let name = coffeeSizeDict[id] {
                    if !coffeeSizes.contains(name) {
                        coffeeSizes.append(name)
                    }
                }
            }
        }
        return coffeeSizes
    }
   
    private func convertCoffeeSizesIntoDict(_ coffeeSizes: [CoffeeSizes]?) -> [String: String]? {
        guard let coffeeSizes = coffeeSizes else {
            return nil
        }
        var coffeeSizeDict = [String: String]()
        for item in coffeeSizes {
            coffeeSizeDict[item.id] = item.name
        }
        return coffeeSizeDict
    }
    
    func getSizeName(_ coffeeStyles: CoffeeStyleItem?, coffeeSizeId: String) -> String?  {
        guard let coffeeStyles = coffeeStyles else {
            return nil
        }
        for size in coffeeStyles.sizes {
            if size.id == coffeeSizeId {
                return size.name
            }
        }
        return nil
    }
}
