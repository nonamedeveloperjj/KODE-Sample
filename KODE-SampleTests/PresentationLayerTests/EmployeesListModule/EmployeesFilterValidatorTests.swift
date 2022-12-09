//
//  EmployeesFilterValidatorTests.swift
//  KODE-SampleTests
//
//  Created by John Snow on 08/12/2022.
//

import XCTest
@testable import KODE_Sample

final class EmployeesFilterValidatorTests: XCTestCase {
    var filterValidator: EmployeesFilterValidator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        filterValidator = EmployeesFilterValidator()
    }
    
    override func tearDownWithError() throws {
        filterValidator = nil
        try super.tearDownWithError()
    }
    
    func testValidatorReturnsZeroEmployeesIfFilterIsNil() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: "firstName1", departmentFilter: nil)
        
        // then
        XCTAssertTrue(filteredEmployees.isEmpty)
    }
    
    func testValidatorReturnsAllEmployeesIfEnteredTextIsEmptyAndAllFilter() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let departmentFilter: EmployeeDepartmentFilter = .all
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: "", departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.elementsEqual(employees))
    }
    
    func testValidatorReturnsAllEmployeesIfEnteredTextIsEmptyAndSpecificFilter() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let departmentFilter: EmployeeDepartmentFilter = .android
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: "", departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.elementsEqual([TestData.employee3]))
        XCTAssertTrue(filteredEmployees.allSatisfy { $0.department == departmentFilter.department() })
    }
    
    func testValidatorReturnsValidFilteredEmployeesWithEnteredTextAllFilter() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let enteredText = "firstName1"
        let departmentFilter: EmployeeDepartmentFilter = .all
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: enteredText, departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.elementsEqual([TestData.employee1]))
        XCTAssertTrue(filteredEmployees.allSatisfy { ($0.firstName + " " + $0.lastName).contains(enteredText) })
    }
    
    func testValidatorReturnsValidFilteredEmployeesWithEnteredUserTagAllFilter() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let enteredText = "userTag1"
        let departmentFilter: EmployeeDepartmentFilter = .all
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: enteredText, departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.elementsEqual([TestData.employee1]))
        XCTAssertTrue(filteredEmployees.allSatisfy { $0.userTag.lowercased().contains(enteredText.lowercased()) })
    }
    
    func testValidatorReturnsValidFilteredEmployeesWithEnteredTextSpecificFilter() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let enteredText = "firstName"
        let departmentFilter: EmployeeDepartmentFilter = .support
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: enteredText, departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.allSatisfy { ($0.firstName + " " + $0.lastName).contains(enteredText) })
        XCTAssertTrue(filteredEmployees.allSatisfy { departmentFilter.department() == $0.department })
        XCTAssertTrue(filteredEmployees.elementsEqual([TestData.employee2]))
    }
    
    func testValidatorReturnsNoEmployeesWithNotPresentedFilter() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let enteredText = "firstName"
        let departmentFilter: EmployeeDepartmentFilter = .iOS
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: enteredText, departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.isEmpty)
    }
    
    func testValidatorReturnsNoEmployeesWithNotPresentedName() {
        // given
        let employees = [TestData.employee1, TestData.employee2, TestData.employee3]
        let enteredText = "other name"
        let departmentFilter: EmployeeDepartmentFilter = .all
        
        // when
        let filteredEmployees = filterValidator.filtered(employees: employees, enteredText: enteredText, departmentFilter: departmentFilter)
        
        // then
        XCTAssertTrue(filteredEmployees.isEmpty)
    }
}

private extension EmployeesFilterValidatorTests {
    enum TestData {
        static let employee1 = Employee(
            id: "id1",
            avatarUrl: "avatarUrl1",
            firstName: "firstName1",
            lastName: "lastName1",
            userTag: "userTag1",
            department: .frontend,
            position: "position1",
            birthday: Date(),
            phone: "123"
        )
        
        static let employee2 = Employee(
            id: "id2",
            avatarUrl: "avatarUrl2",
            firstName: "firstName2",
            lastName: "lastName2",
            userTag: "userTag2",
            department: .support,
            position: "position2",
            birthday: Date(),
            phone: "1234"
        )
        
        static let employee3 = Employee(
            id: "id3",
            avatarUrl: "avatarUrl3",
            firstName: "firstName3",
            lastName: "lastName3",
            userTag: "userTag3",
            department: .android,
            position: "position3",
            birthday: Date(),
            phone: "12345"
        )
    }
}
