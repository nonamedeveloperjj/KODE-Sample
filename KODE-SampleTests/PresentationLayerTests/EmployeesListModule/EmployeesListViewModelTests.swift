//
//  EmployeesListViewModelTests.swift
//  KODE-SampleTests
//
//  Created by John Snow on 15/11/2022.
//

import XCTest
@testable import KODE_Sample

final class EmployeesListViewModelTests: XCTestCase {
    private var employeesServiceMock: EmployeesServiceProtocolMock!
    private var rowsFactoryMock: EmployeesListRowsFactoryProtocolMock!
    private var viewModel: EmployeesListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        employeesServiceMock = EmployeesServiceProtocolMock()
        rowsFactoryMock = EmployeesListRowsFactoryProtocolMock()
        viewModel = EmployeesListViewModel(employeesService: employeesServiceMock, rowsFactory: rowsFactoryMock)
    }
    
    override func tearDownWithError() throws {
        employeesServiceMock = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testFetchEmployeesCallsServiceAndChangesLoadingState() {
        // given
        
        // when
        viewModel.fetchEmployees()
        
        // then
        XCTAssertEqual(viewModel.isLoadingEmployees, true)
        XCTAssertEqual(employeesServiceMock.fetchEmployeesCompletionCallsCount, 1)
    }
    
    func testFetchEmployeesChangesStateOnSuccess() {
        // given
        let employeesResponse = EmployeesResponse(items: [TestData.employee2, TestData.employee1])
        
        employeesServiceMock.fetchEmployeesCompletionClosure = { completion in
            let result: Result<EmployeesResponse, Error> = .success(employeesResponse)
            completion(result)
        }
        
        // when
        viewModel.employeesSortState = .alphabet
        viewModel.fetchEmployees()
        
        // then
        XCTAssertEqual(viewModel.isLoadingEmployees, false)
        XCTAssertEqual(viewModel.employees, employeesResponse.items.sorted(by: { $0.firstName < $1.firstName }))
    }
    
    func testFetchEmployeesChangesStateOnFailure() {
        // given
        let obtainedError = NSError(domain: "", code: 0)
        employeesServiceMock.fetchEmployeesCompletionClosure = { completion in
            let result: Result<EmployeesResponse, Error> = .failure(obtainedError)
            completion(result)
        }
        
        // when
        viewModel.fetchEmployees()
        
        // then
        XCTAssertEqual(viewModel.isLoadingEmployees, false)
        XCTAssertEqual(viewModel.fetchEmployeesError! as NSError, obtainedError)
    }
    
    func testEmployeesSortedByBirthdayOnChangeSortState() {
        // given
        viewModel.employees = [TestData.employee1, TestData.employee2]
        
        // when
        viewModel.employeesSortState = .birtday
        
        // then
        XCTAssertTrue(viewModel.employees.elementsEqual([TestData.employee1, TestData.employee2].sorted(by: { $0.birthday < $1.birthday })))
    }
    
    func testEmployeesSortedByAlphabetOnChangeSortState() {
        // given
        viewModel.employees = [TestData.employee2, TestData.employee1]
        
        // when
        viewModel.employeesSortState = .alphabet
        
        // then
        XCTAssertTrue(viewModel.employees.elementsEqual([TestData.employee1, TestData.employee2].sorted(by: { $0.firstName < $1.firstName })))
    }
    
    func testRowProvidersCreatedProperly() {
        // given
        let employeesResponse = EmployeesResponse(items: [TestData.employee2, TestData.employee1])
        
        employeesServiceMock.fetchEmployeesCompletionClosure = { completion in
            let result: Result<EmployeesResponse, Error> = .success(employeesResponse)
            completion(result)
        }
        viewModel.fetchEmployees()
        let enteredText = "name1"
        let rowProviders = [EmployeesListDateSeparatorRowModel(date: "2023")]
        rowsFactoryMock.createRowModelsFromSortOrderReturnValue = rowProviders
        
        // when
        let rowProviderWrappers = viewModel.rowProviders(with: enteredText)
        
        // then
        XCTAssertEqual(rowsFactoryMock.createRowModelsFromSortOrderCallsCount, 1)
        XCTAssertEqual(rowsFactoryMock.createRowModelsFromSortOrderReceivedArguments!.sortOrder, viewModel.employeesSortState)
        XCTAssertTrue(
            rowsFactoryMock.createRowModelsFromSortOrderReceivedArguments!.employees
                .elementsEqual(viewModel.employees.filter({ isIncluded(employee: $0, enteredText: enteredText) })))
        XCTAssertTrue(
            rowProviderWrappers.map({ $0.rowProvider as! EmployeesListDateSeparatorRowModel })
                .elementsEqual(rowProviders)
        )
    }
    
    private func isIncluded(employee: Employee, enteredText: String) -> Bool {
        if enteredText.isEmpty {
            return true
        }
        let fullName = employee.firstName + " " + employee.lastName
        return fullName.lowercased().contains(enteredText.lowercased())
    }
}

private extension EmployeesListViewModelTests {
    enum TestData {
        static var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return dateFormatter
        }
        
        static let employee1 = Employee(
            id: "id1",
            avatarUrl: "url1",
            firstName: "name1",
            lastName: "name1",
            userTag: "userTag",
            department: "dep1",
            position: "pos1",
            birthday: dateFormatter.date(from: "2001-04-01T11:42:00")!,
            phone: "123"
        )
        
        static let employee2 = Employee(
            id: "id2",
            avatarUrl: "url2",
            firstName: "name2",
            lastName: "name2",
            userTag: "userTag",
            department: "dep2",
            position: "pos2",
            birthday: dateFormatter.date(from: "2000-11-09T13:02:00")!,
            phone: "321"
        )
    }
}
