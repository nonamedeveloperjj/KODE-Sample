//
//  EmployeesListBirthdayFactoryStrategyTests.swift
//  KODE-SampleTests
//
//  Created by John Snow on 29/11/2022.
//

import XCTest
@testable import KODE_Sample

final class EmployeesListBirthdayFactoryStrategyTests: XCTestCase {
    var factoryStrategy: EmployeesListBirthdayFactoryStrategy!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        factoryStrategy = EmployeesListBirthdayFactoryStrategy()
    }

    override func tearDownWithError() throws {
        factoryStrategy = nil
        try super.tearDownWithError()
    }

    func testFactoryStrategyCreatesProperRowModels() {
        // given
        let employees = TestData.employees
        
        // when
        let rowProviders = factoryStrategy.rowProviders(from: employees)
        
        // then
        let dateSeparatorIndex = rowProviders.firstIndex(where: { $0 is EmployeesListDateSeparatorRowModel })
        
        if let dateSeparatorIndex = dateSeparatorIndex {
            let currentYearRowModels = Array(rowProviders.prefix(upTo: dateSeparatorIndex)) as! [EmployeesListRowModel]
            XCTAssertTrue(
                currentYearRowModels.sorted(by: { stringToDate($0.birthday) < stringToDate($1.birthday) }).elementsEqual(currentYearRowModels)
            )
            
            currentYearRowModels.forEach({ validateRowModel($0, employee: employee(with: $0.id)) })
            
            let dateSeparatorRowModel = rowProviders[dateSeparatorIndex] as! EmployeesListDateSeparatorRowModel
            XCTAssertEqual(Int(dateSeparatorRowModel.date), nextYear())
            
            let nextYearRowModels = Array(rowProviders[dateSeparatorIndex + 1 ..< rowProviders.count]) as! [EmployeesListRowModel]
            XCTAssertTrue(
                nextYearRowModels.sorted(by: { stringToDate($0.birthday) < stringToDate($1.birthday) }).elementsEqual(nextYearRowModels)
            )
            
            nextYearRowModels.forEach({ validateRowModel($0, employee: employee(with: $0.id)) })

        } else {
            let castedRowModels = rowProviders as! [EmployeesListRowModel]
            XCTAssertTrue(
                castedRowModels.sorted(by: { stringToDate($0.birthday) < stringToDate($1.birthday) }).elementsEqual(castedRowModels)
            )
            castedRowModels.forEach({ validateRowModel($0, employee: employee(with: $0.id)) })
        }
    }
    
    private func stringToDate(_ stringDate: String) -> Date {
        return TestData.dateFormatter.date(from: stringDate)!
    }
    
    private func nextYear() -> Int {
        let yearComponent = TestData.calendar.dateComponents([.year], from: Date()).year
        let nextYear = yearComponent! + 1
        return nextYear
    }
    
    private func validateRowModel(_ rowModel: EmployeesListRowModel, employee: Employee) {
        XCTAssertEqual(rowModel.id, employee.id)
        XCTAssertEqual(rowModel.avatarUrl, employee.avatarUrl)
        XCTAssertEqual(rowModel.firstName, employee.firstName)
        XCTAssertEqual(rowModel.lastName, employee.lastName)
        XCTAssertEqual(rowModel.userTag, employee.userTag)
        XCTAssertEqual(rowModel.position, employee.position)
        XCTAssertEqual(rowModel.birthday, TestData.dateFormatter.string(from: employee.birthday))
        XCTAssertEqual(rowModel.shouldShowBirtday, true)
    }
    
    private func employee(with id: String) -> Employee {
        TestData.employees.first(where: { $0.id == id })!
    }
}

private extension EmployeesListBirthdayFactoryStrategyTests {
    enum TestData {
        static let calendar = Calendar.current
        static var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM"
            dateFormatter.applyCustomShortMonthSymbols()
            return dateFormatter
        }
        
        static let employees = [
            Employee(
                id: "id0",
                avatarUrl: "avatarUrl0",
                firstName: "steve",
                lastName: "lastName0",
                userTag: "userTag0",
                department: .backOffice,
                position: "position0",
                birthday: calendar.date(from: DateComponents(year: 1990, month: 2, day: 12))!,
                phone: "phone0"
            ),
            Employee(
                id: "id1",
                avatarUrl: "avatarUrl1",
                firstName: "albert",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .android,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1997, month: 7, day: 12))!,
                phone: "phone1"
            ),
            Employee(
                id: "id2",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .iOS,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 12, day: 29))!,
                phone: "phone1"
            ),
            Employee(
                id: "id3",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .management,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1999, month: 3, day: 5))!,
                phone: "phone1"
            ),
            Employee(
                id: "id4",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .analytics,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 1, day: 22))!,
                phone: "phone1"
            ),
            Employee(
                id: "id5",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .design,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 8, day: 10))!,
                phone: "phone1"
            ),
            Employee(
                id: "id6",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .support,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 4, day: 16))!,
                phone: "phone1"
            ),
            Employee(
                id: "id7",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .QA,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 9, day: 11))!,
                phone: "phone1"
            ),
            Employee(
                id: "id8",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .frontend,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 10, day: 27))!,
                phone: "phone1"
            ),
            Employee(
                id: "id9",
                avatarUrl: "avatarUrl1",
                firstName: "thomas",
                lastName: "lastName1",
                userTag: "userTag1",
                department: .management,
                position: "position1",
                birthday: calendar.date(from: DateComponents(year: 1992, month: 12, day: 31))!,
                phone: "phone1"
            )
        ]
    }
}
