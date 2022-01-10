//
//  OverviewViewModel.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 05/01/22.
//

import Foundation

// This class contains business logic for overview viewcontroller class
final class OverviewViewModel {
    
    var overviewSelectionImages = ["Select the amount of sugar": "cappuchino", "Select type of milk": "milk", "Large": "large", "Venti": "small", "Tall": "medium", "Espresso": "espresso", "Cappuccino": "cappuchino", "Lungo": "large"]
    
    func getSelectedExtrasList(_ extrasList: [[String: [String]]], selectedExtras: [IndexPath: Bool]) -> [[String: [String]]] {
        var selectedExtrasList = [[String: [String]]]()
        
        for (index, value) in selectedExtras {
            if value == true {
                let selectedExtra = extrasList[index.section-1]
                var selectedSubExtra = ""
                let selectedExtraArray = selectedExtra.values.flatMap { $0 }
                for i in 0..<selectedExtraArray.count {
                    if i == index.row {
                        let selectedExtraItem = selectedExtraArray[i]
                        selectedSubExtra = selectedExtraItem
                    }
                }
                selectedExtrasList.append([extrasList[index.section-1].keys.first ?? "": [selectedSubExtra]])
            }
        }
        return selectedExtrasList
    }
    
    func getSelectedSections(_ selectedExtrasList: [[String: [String]]]) -> [Section]? {
        var sectionsData = [Section]()
        for item in selectedExtrasList {
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
