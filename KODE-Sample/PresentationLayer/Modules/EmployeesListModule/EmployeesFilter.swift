//
//  EmployeesFilter.swift
//  KODE-Sample
//
//  Created by John Snow on 08/12/2022.
//

import Foundation

// sourcery: AutoMockable
protocol EmployeesFilterProtocol: AnyObject {
    func filtered(
        employees: [Employee],
        enteredText: String,
        departmentFilter: EmployeeDepartment?
    ) -> [Employee]
}

final class EmployeesFilter: EmployeesFilterProtocol {
    func filtered(
        employees: [Employee],
        enteredText: String,
        departmentFilter: EmployeeDepartment?
    ) -> [Employee] {
        guard let departmentFilter = departmentFilter else {
            return []
        }
        return employees.filter { isIncluded(employee: $0, enteredText: enteredText, departmentFilter: departmentFilter) }
    }
    
    private func isIncluded(
        employee: Employee,
        enteredText: String,
        departmentFilter: EmployeeDepartment
    ) -> Bool {
        let lowercasedEnteredText = enteredText.lowercased()
        let fullName = employee.firstName + " " + employee.lastName
        let isNameIncluded = enteredText.isEmpty || fullName.lowercased().contains(lowercasedEnteredText)
        let isDepartmentIncluded = departmentFilter == .all || departmentFilter.department() == employee.department
        let isUserTagIncluded = employee.userTag.lowercased().contains(lowercasedEnteredText)
        return (isNameIncluded || isUserTagIncluded) && isDepartmentIncluded
    }
}
