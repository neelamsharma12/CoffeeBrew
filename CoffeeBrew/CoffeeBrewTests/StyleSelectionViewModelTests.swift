//
//  CoffeeBrewTests.swift
//  CoffeeBrewTests
//
//  Created by Neelam Sharma on 30/12/21.
//

import XCTest
@testable import CoffeeBrew

class StyleSelectionViewModelTests: XCTestCase {

    // MARK: - sut under test
    var sut: StyleSelectionViewModel!

    // MARK: - Fakes and spies
    var fakeService: CoffeeBrewFakeDataService!
    var spy: Spy!

    override func setUpWithError() throws {
        fakeService = CoffeeBrewFakeDataService()
        let delegate = StyleSelectionViewModelDelegateSpy()
        spy = delegate
        sut = StyleSelectionViewModel(sessionProvider: fakeService, delegate: delegate)
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        fakeService = nil
        sut = nil
    }
    
    func test_load_style_selection_list_data_success() {
        /// Arrange
        fakeService.configure(request: .loadCoffeeStyleListData, result: .success(MockData.mockDataForCoffeeStyleItem()))

        let resultExpectation = expectation(description: "wait expectation")

        /// Act
        sut.getCoffeeStyleList()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            resultExpectation.fulfill()
        }

        wait(for: [resultExpectation], timeout: 3.0)

        /// Assert
        let function = StyleSelectionViewModelDelegateSpy.Function.didLoadCoffeeStyleList.rawValue
        let didSuccess = spy.didCall(functionName: function)
        XCTAssertTrue(didSuccess)
        XCTAssertFalse(spy.didCall(functionName: StyleSelectionViewModelDelegateSpy.Function.didFailLoadingCoffeeStyleList.rawValue))
    }

    func test_load_recipe_list_data_failure() {
        /// Arrange
        fakeService.configure(request: .loadCoffeeStyleListData, result: .failure(MockError()))

        /// Act
        sut.getCoffeeStyleList()

        /// Assert
        let function = StyleSelectionViewModelDelegateSpy.Function.didFailLoadingCoffeeStyleList.rawValue
        let didFail = spy.didCall(functionName: function)
        XCTAssertTrue(didFail)
        XCTAssertFalse(spy.didCall(functionName: StyleSelectionViewModelDelegateSpy.Function.didLoadCoffeeStyleList.rawValue))
    }

}
