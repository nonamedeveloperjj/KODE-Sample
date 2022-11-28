//
//  EmployeesListAlphabetFactoryStrategy.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import Foundation

final class EmployeesListAlphabetFactoryStrategy: EmployeesListRowsFactoryStrategy {
    func rowProviders(from employees: [Employee]) -> [any RowProvider] {
        var rowProviders: [any RowProvider] = []
        let sortedEmployees = employees.sorted(by: { $0.firstName < $1.firstName })
        
        sortedEmployees.forEach { employee in
            let rowModel = EmployeesListRowModel(
                id: employee.id,
                avatarUrl: employee.avatarUrl,
                firstName: employee.firstName,
                lastName: employee.lastName,
                userTag: employee.userTag,
                position: employee.position,
                birthday: "",
                shouldShowBirtday: false
            )
            rowProviders.append(rowModel)
        }
        
        return rowProviders
    }
}
