//
//  EmployeesFilterValidator.swift
//  KODE-Sample
//
//  Created by John Snow on 08/12/2022.
//

import Foundation

// sourcery: AutoMockable
protocol EmployeesFilterValidatorProtocol: AnyObject {
    func filtered(
        employees: [Employee],
        enteredText: String,
        departmentFilter: EmployeeDepartmentFilter?
    ) -> [Employee]
}

final class EmployeesFilterValidator: EmployeesFilterValidatorProtocol {
    func filtered(
        employees: [Employee],
        enteredText: String,
        departmentFilter: EmployeeDepartmentFilter?
    ) -> [Employee] {
        guard let departmentFilter = departmentFilter else {
            return []
        }
        return employees.filter { isValid(employee: $0, enteredText: enteredText, departmentFilter: departmentFilter) }
    }
    
    private func isValid(
        employee: Employee,
        enteredText: String,
        departmentFilter: EmployeeDepartmentFilter
    ) -> Bool {
        let fullName = employee.firstName + " " + employee.lastName
        let isNameIncluded = enteredText.isEmpty || fullName.lowercased().contains(enteredText.lowercased())
        let isDepartmentIncluded = departmentFilter == .all || departmentFilter.department() == employee.department
        return isNameIncluded && isDepartmentIncluded
    }
}
