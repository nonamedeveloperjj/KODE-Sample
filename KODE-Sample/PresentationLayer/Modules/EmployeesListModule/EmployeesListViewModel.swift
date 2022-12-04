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
    
    init(employeesService: EmployeesServiceProtocol, rowsFactory: EmployeesListRowsFactoryProtocol) {
        self.employeesService = employeesService
        self.rowsFactory = rowsFactory
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
    
    func rowProviders(with enteredText: String) -> [RowProviderWrapper] {
        let filteredEmployees = employees.filter({ isIncluded(employee: $0, enteredText: enteredText) })
        let rowModels = rowsFactory.createRowModels(from: filteredEmployees, sortOrder: employeesSortState)
        return rowModels.map({ RowProviderWrapper(rowProvider: $0) })
    }
    
    func rowModel(with id: Int) -> Employee? {
        return employees.first(where: { $0.id.hashValue == id })
    }
    
    private func isIncluded(employee: Employee, enteredText: String) -> Bool {
        if enteredText.isEmpty {
            return true
        }
        let fullName = employee.firstName + " " + employee.lastName
        return fullName.lowercased().contains(enteredText.lowercased())
    }
    
    private func sortEmployees(sortState: EmployeesSortOrder) {
        employees.sort(by: {
            sortState == .alphabet ? $0.firstName < $1.firstName : $0.birthday < $1.birthday
        })
    }
}
