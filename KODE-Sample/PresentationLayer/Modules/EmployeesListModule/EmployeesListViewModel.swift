//
//  EmployeesListViewModel.swift
//  KODE-Sample
//
//  Created by John Snow on 03/11/2022.
//

import Foundation

final class EmployeesListViewModel: ObservableObject {
    @Published var employees: [Employee] = Array(repeating: Employee.placeholderModel, count: 10)
    @Published var isLoadingEmployees = false
    @Published var fetchEmployeesError: Error?
    @Published var employeesSortState: EmployeesSortOrder = .alphabet {
        willSet {
            sortEmployees(sortState: newValue)
        }
    }
    
    private let employeesService: EmployeesServiceProtocol
    private let rowsFactory: EmployeesListRowsFactoryProtocol
    private let employeesFilter: EmployeesFilterProtocol
    
    init(
        employeesService: EmployeesServiceProtocol,
        rowsFactory: EmployeesListRowsFactoryProtocol,
        employeesFilter: EmployeesFilterProtocol
    ) {
        self.employeesService = employeesService
        self.rowsFactory = rowsFactory
        self.employeesFilter = employeesFilter
    }
    
    func fetchEmployees() {
        isLoadingEmployees = true
        fetchEmployeesError = nil
        
        employeesService.fetchEmployees { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case let .success(response):
                self.employees = response.items
                self.sortEmployees(sortState: self.employeesSortState)
            case let .failure(error):
                self.fetchEmployeesError = error
            }
            self.isLoadingEmployees = false
        }
    }
    
    func rowProviders(with enteredText: String, departmentFilter: EmployeeDepartment?) -> [RowProviderWrapper] {
        let filteredEmployees = employeesFilter.filtered(
            employees: employees,
            enteredText: enteredText,
            departmentFilter: departmentFilter
        )
        let rowModels = rowsFactory.createRowModels(from: filteredEmployees, sortOrder: employeesSortState)
        return rowModels.map({ RowProviderWrapper(rowProvider: $0) })
    }
    
    func rowModel(with id: Int) -> Employee? {
        return employees.first(where: { $0.id.hashValue == id })
    }
    
    private func sortEmployees(sortState: EmployeesSortOrder) {
        employees.sort(by: {
            sortState == .alphabet ? $0.firstName < $1.firstName : $0.birthday < $1.birthday
        })
    }
}
