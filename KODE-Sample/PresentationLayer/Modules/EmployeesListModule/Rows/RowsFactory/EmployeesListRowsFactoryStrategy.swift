//
//  EmployeesListRowsFactoryStrategy.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import Foundation

// sourcery: AutoMockable
protocol EmployeesListRowsFactoryStrategy {
    func rowProviders(from employees: [Employee]) -> [any RowProvider]
}
