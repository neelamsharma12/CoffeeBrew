//
//  MockDataForLoadStyleSelectionList.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import Foundation
@testable import CoffeeBrew

public class MockData {
    
    static func mockDataForCoffeeStyleItem() -> CoffeeStyleItem {
        return CoffeeStyleItem(types: [CoffeeType(coffeeId: "60ba1a062e35f2d9c786c56d", name: "Ristretto", sizes: ["60ba18d13ca8c43196b5f606", "60ba3368c45ecee5d77a016b"], extras: ["60ba197c2e35f2d9c786c525"])], sizes: [CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba3368c45ecee5d77a016b", name: "Venti"), CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba33dbc45ecee5d77a01f8", name: "Tall")], extras: [Extras(id: "60ba197c2e35f2d9c786c525", name: "Select the amount of sugar", subselections: [Subselections(id: "60ba194dfdd5e192e14eaa75", name: "A lot")])])
    }

    static func mockDataForCoffeeStyleItemForEmptySizeList() -> CoffeeStyleItem {
        return CoffeeStyleItem(types: [CoffeeType(coffeeId: "60ba1a062e35f2d9c786c56d", name: "Ristretto", sizes: ["60ba18d13ca8c43196b5f6061", "60ba3368c45ecee5d77a016b2"], extras: ["60ba197c2e35f2d9c786c525"])], sizes: [CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba3368c45ecee5d77a016b", name: "Venti"), CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba33dbc45ecee5d77a01f8", name: "Tall")], extras: [Extras(id: "60ba197c2e35f2d9c786c525", name: "Select the amount of sugar", subselections: [Subselections(id: "60ba194dfdd5e192e14eaa75", name: "A lot")])])
    }

    static func mockDataForCoffeeStyleItemForSizeListWithOneResult() -> CoffeeStyleItem {
        return CoffeeStyleItem(types: [CoffeeType(coffeeId: "60ba1a062e35f2d9c786c56d", name: "Ristretto", sizes: ["60ba18d13ca8c43196b5f6061", "60ba3368c45ecee5d77a016b"], extras: ["60ba197c2e35f2d9c786c525"])], sizes: [CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba3368c45ecee5d77a016b", name: "Venti"), CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba33dbc45ecee5d77a01f8", name: "Tall")], extras: [Extras(id: "60ba197c2e35f2d9c786c525", name: "Select the amount of sugar", subselections: [Subselections(id: "60ba194dfdd5e192e14eaa75", name: "A lot")])])
    }
    
    static func mockDataForCoffeeStyleItemForEmptyExtrasList() -> CoffeeStyleItem {
        return CoffeeStyleItem(types: [CoffeeType(coffeeId: "60ba1a062e35f2d9c786c56d", name: "Ristretto", sizes: ["60ba18d13ca8c43196b5f6061", "60ba3368c45ecee5d77a016b2"], extras: ["60ba197c2e35f2d9c786c5251"])], sizes: [CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba3368c45ecee5d77a016b", name: "Venti"), CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba33dbc45ecee5d77a01f8", name: "Tall")], extras: [Extras(id: "60ba197c2e35f2d9c786c525", name: "Select the amount of sugar", subselections: [Subselections(id: "60ba194dfdd5e192e14eaa75", name: "A lot")])])
    }
    
    static func mockDataForCoffeeStyleItemForMoreThanOneExtraItems() -> CoffeeStyleItem {
        return CoffeeStyleItem(types: [CoffeeType(coffeeId: "60ba1a062e35f2d9c786c56d", name: "Ristretto", sizes: ["60ba18d13ca8c43196b5f606", "60ba3368c45ecee5d77a016b"], extras: ["60ba197c2e35f2d9c786c525", "60ba197c2e35f2d9c786c5251"])], sizes: [CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba3368c45ecee5d77a016b", name: "Venti"), CoffeeSizes(id: "60ba18d13ca8c43196b5f606", name: "Large"), CoffeeSizes(id: "60ba33dbc45ecee5d77a01f8", name: "Tall")], extras: [Extras(id: "60ba197c2e35f2d9c786c525", name: "Select the amount of sugar", subselections: [Subselections(id: "60ba194dfdd5e192e14eaa75", name: "A lot")]), Extras(id: "60ba197c2e35f2d9c786c5251", name: "Select the amount of milk", subselections: [Subselections(id: "60ba194dfdd5e192e14eaa75", name: "soy")])])
    }
    
    static func mockDataForSection() -> [[String: [String]]] {
        return [["Select the amount of sugar": ["A lot", "Normal"], "Select type of milk": ["Soy", "Oat", "Cow"]]]
    }
    
}
