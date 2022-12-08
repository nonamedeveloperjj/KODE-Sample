//
//  EmployeesListAlphabetFactoryStrategyTests.swift
//  KODE-SampleTests
//
//  Created by John Snow on 29/11/2022.
//

import XCTest
@testable import KODE_Sample

final class EmployeesListAlphabetFactoryStrategyTests: XCTestCase {
    var factoryStrategy: EmployeesListAlphabetFactoryStrategy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        factoryStrategy = EmployeesListAlphabetFactoryStrategy()
    }
    
    override func tearDownWithError() throws {
        factoryStrategy = nil
        try super.tearDownWithError()
    }
    
    func testFactoryCreatesProperRowProviders() {
        // given
        let employees = TestData.employees
        let sortedEmployees = employees.sorted(by: { $0.firstName < $1.firstName })
        
        // when
        let rowProviders = factoryStrategy.rowProviders(from: employees)
        
        // then
        let castedRowProviders = rowProviders as! [EmployeesListRowModel]
        XCTAssertTrue(castedRowProviders.sorted(by: { $0.firstName < $1.firstName }).elementsEqual(castedRowProviders))
        
        castedRowProviders.enumerated().forEach { pair in
            XCTAssertTrue(sortedEmployees[pair.offset].id == pair.element.id)
            XCTAssertTrue(sortedEmployees[pair.offset].avatarUrl == pair.element.avatarUrl)
            XCTAssertTrue(sortedEmployees[pair.offset].firstName == pair.element.firstName)
            XCTAssertTrue(sortedEmployees[pair.offset].lastName == pair.element.lastName)
            XCTAssertTrue(sortedEmployees[pair.offset].userTag == pair.element.userTag)
            XCTAssertTrue(sortedEmployees[pair.offset].position == pair.element.position)
            XCTAssertTrue(pair.element.birthday.isEmpty)
            XCTAssertFalse(pair.element.shouldShowBirtday)
        }
    }
}

private extension EmployeesListAlphabetFactoryStrategyTests {
    enum TestData {
        static let employees = [
            Employee(
                id: "id0",
                avatarUrl: "avatarUrl0",
                firstName: "steve",
                lastName: "lastName0",
                userTag: "userTag0",
                department: .HR,
                position: "position0",
                birthday: Date(),
                phone: "phone0"
            ),
            Employee(
                id: "id2",
                avatarUrl: "avatarUrl1",
                firstName: "albert",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .support,
                position: "position1",
                birthday: Date(),
                phone: "phone1"
            ),
            Employee(
                id: "id3",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .backend,
                position: "position1",
                birthday: Date(),
                phone: "phone1"
            )
        ]
    }
}
