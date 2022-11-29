//
//  EmployeesListRowsFactory.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import Foundation

// sourcery: AutoMockable
protocol EmployeesListRowsFactoryProtocol {
    func createRowModels(from employees: [Employee], sortOrder: EmployeesSortOrder) -> [any RowProvider]
}

final class EmployeesListRowsFactory: EmployeesListRowsFactoryProtocol {
    private let strategyProvider: EmployeesListRowsFactoryStrategyProviderProtocol
    
    init(strategyProvider: EmployeesListRowsFactoryStrategyProviderProtocol) {
        self.strategyProvider = strategyProvider
    }
    
    func createRowModels(from employees: [Employee], sortOrder: EmployeesSortOrder) -> [any RowProvider] {
        let strategy = strategyProvider.strategy(for: sortOrder)
        return strategy.rowProviders(from: employees)
    }
}
