//
//  SizeSelectionViewModelTests.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 04/01/22.
//

import XCTest
@testable import CoffeeBrew

class SizeSelectionViewModelTests: XCTestCase {

    // MARK: - sut under test
    var sut: SizeSelectionViewModel!

    override func setUpWithError() throws {
        sut = SizeSelectionViewModel()
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_get_size_List_success() {
        let result = sut.getSizeList(MockData.mockDataForCoffeeStyleItem().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItem())
        XCTAssertNotNil(result)
    }
    
    func test_get_size_List_success_with_empty_result() {
        let result = sut.getSizeList(MockData.mockDataForCoffeeStyleItemForEmptySizeList().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItemForEmptySizeList())
        XCTAssertTrue(result.count == 0)
    }

    func test_get_size_List_success_with_one_result_size() {
        let result = sut.getSizeList(MockData.mockDataForCoffeeStyleItemForSizeListWithOneResult().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItemForSizeListWithOneResult())
        XCTAssertTrue(result.count == 1)
    }
    
    func test_get_size_List_success_with__more_than_one_result_size() {
        let result = sut.getSizeList(MockData.mockDataForCoffeeStyleItem().types.first, coffeeStyles: MockData.mockDataForCoffeeStyleItem())
        XCTAssertTrue(result.count == 2)
    }

}
