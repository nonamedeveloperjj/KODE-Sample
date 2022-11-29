//
//  EmployeesListRowsFactoryTests.swift
//  KODE-SampleTests
//
//  Created by John Snow on 29/11/2022.
//

import XCTest
@testable import KODE_Sample

final class EmployeesListRowsFactoryTests: XCTestCase {
    var factory: EmployeesListRowsFactory!
    var strategyProviderMock: EmployeesListRowsFactoryStrategyProviderProtocolMock!
    var strategyMock: EmployeesListRowsFactoryStrategyMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        strategyProviderMock = EmployeesListRowsFactoryStrategyProviderProtocolMock()
        factory = EmployeesListRowsFactory(strategyProvider: strategyProviderMock)
        strategyMock = EmployeesListRowsFactoryStrategyMock()
    }

    override func tearDownWithError() throws {
        strategyProviderMock = nil
        factory = nil
        strategyMock = nil
        try super.tearDownWithError()
    }

    func testFactoryCreatesRowProvidersWithBirthdaySortOrder() {
        // given
        let sortOrder: EmployeesSortOrder = .birtday
        let employees = [Employee.placeholderModel]
        
        strategyProviderMock.strategyForReturnValue = strategyMock
        strategyMock.rowProvidersFromReturnValue = [EmployeesListDateSeparatorRowModel(date: "2023")]
        
        // when
        let rowModels = factory.createRowModels(from: [Employee.placeholderModel], sortOrder: sortOrder)
        
        // then
        XCTAssertEqual(strategyProviderMock.strategyForCallsCount, 1)
        XCTAssertEqual(strategyProviderMock.strategyForReceivedSortOrder, sortOrder)
        
        XCTAssertEqual(strategyMock.rowProvidersFromCallsCount, 1)
        XCTAssertTrue(strategyMock.rowProvidersFromReceivedEmployees!.elementsEqual(employees))
        XCTAssertTrue(
            (rowModels as! [EmployeesListDateSeparatorRowModel])
                .elementsEqual((strategyMock.rowProvidersFromReturnValue) as! [EmployeesListDateSeparatorRowModel]))
    }
}
