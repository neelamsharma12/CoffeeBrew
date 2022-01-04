//
//  ExtrasSelectionViewModelTests.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import XCTest
@testable import CoffeeBrew

class ExtrasSelectionViewModelTests: XCTestCase {

    // MARK: - sut under test
    var sut: ExtrasSelectionViewModel!

    override func setUpWithError() throws {
        sut = ExtrasSelectionViewModel()
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_get_extras_List_success() {
        let result = sut.getExtrasList(MockData.mockDataForCoffeeStyleItem().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItem())
        print(result)
        XCTAssertNotNil(result)
    }
    
    func test_get_extras_List_success_with_empty_result() {
        let result = sut.getExtrasList(MockData.mockDataForCoffeeStyleItemForEmptyExtrasList().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItemForEmptyExtrasList())
        XCTAssertTrue(result.count == 0)
    }

    func test_get_extras_List_success_with_one_result_size() {
        let result = sut.getExtrasList(MockData.mockDataForCoffeeStyleItem().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItem())
        XCTAssertTrue(result.count == 1)
    }
    
    func test_get_extras_List_success_with__more_than_one_result_size() {
        let result = sut.getExtrasList(MockData.mockDataForCoffeeStyleItemForMoreThanOneExtraItems().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItemForMoreThanOneExtraItems())
        XCTAssertTrue(result.count == 2)
    }

    func test_get_sections_failure_with_empty_result() {
        XCTAssertTrue(sut.getSections([[String: [String]]]())?.count == 0)
    }
    
    func test_get_sections_success_response() {
        XCTAssertTrue(sut.getSections(MockData.mockDataForSection())!.count > 0)
    }
}
