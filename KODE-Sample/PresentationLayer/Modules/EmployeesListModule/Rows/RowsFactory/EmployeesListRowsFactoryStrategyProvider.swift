//
//  EmployeesListRowsFactoryStrategyProvider.swift
//  KODE-Sample
//
//  Created by John Snow on 24/11/2022.
//

import Foundation

// sourcery: AutoMockable
protocol EmployeesListRowsFactoryStrategyProviderProtocol {
    func strategy(for sortOrder: EmployeesSortOrder) -> EmployeesListRowsFactoryStrategy
}

final class EmployeesListRowsFactoryStrategyProvider: EmployeesListRowsFactoryStrategyProviderProtocol {
    func strategy(for sortOrder: EmployeesSortOrder) -> EmployeesListRowsFactoryStrategy {
        switch sortOrder {
        case .alphabet:
            return EmployeesListAlphabetFactoryStrategy()
        case .birtday:
            return EmployeesListBirthdayFactoryStrategy()
        }
    }
}
