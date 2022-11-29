//
//  EmployeesListRowsFactoryStrategyProviderTests.swift
//  KODE-SampleTests
//
//  Created by John Snow on 29/11/2022.
//

import XCTest
@testable import KODE_Sample

final class EmployeesListRowsFactoryStrategyProviderTests: XCTestCase {
    var strategyProvider: EmployeesListRowsFactoryStrategyProvider!

    override func setUpWithError() throws {
        try super.setUpWithError()
        strategyProvider = EmployeesListRowsFactoryStrategyProvider()
    }

    override func tearDownWithError() throws {
        strategyProvider = nil
        try super.tearDownWithError()
    }
    
    func testStrategyProviderReturnsAlphabetStrategy() {
        // given
        let sortOrder: EmployeesSortOrder = .alphabet
        
        // when
        let strategy = strategyProvider.strategy(for: sortOrder)
        
        // then
        XCTAssertTrue(strategy is EmployeesListAlphabetFactoryStrategy)
    }
    
    func testStrategyProviderReturnsBirthdayStrategy() {
        // given
        let sortOrder: EmployeesSortOrder = .birtday
        
        // when
        let strategy = strategyProvider.strategy(for: sortOrder)
        
        // then
        XCTAssertTrue(strategy is EmployeesListBirthdayFactoryStrategy)
    }
}
