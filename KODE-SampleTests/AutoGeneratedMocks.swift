// Generated using Sourcery 1.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import KODE_Sample














class EmployeesFilterProtocolMock: EmployeesFilterProtocol {

    //MARK: - filtered

    var filteredEmployeesEnteredTextDepartmentFilterCallsCount = 0
    var filteredEmployeesEnteredTextDepartmentFilterCalled: Bool {
        return filteredEmployeesEnteredTextDepartmentFilterCallsCount > 0
    }
    var filteredEmployeesEnteredTextDepartmentFilterReceivedArguments: (employees: [Employee], enteredText: String, departmentFilter: EmployeeDepartment?)?
    var filteredEmployeesEnteredTextDepartmentFilterReceivedInvocations: [(employees: [Employee], enteredText: String, departmentFilter: EmployeeDepartment?)] = []
    var filteredEmployeesEnteredTextDepartmentFilterReturnValue: [Employee]!
    var filteredEmployeesEnteredTextDepartmentFilterClosure: (([Employee], String, EmployeeDepartment?) -> [Employee])?

    func filtered(employees: [Employee], enteredText: String, departmentFilter: EmployeeDepartment?) -> [Employee] {
        filteredEmployeesEnteredTextDepartmentFilterCallsCount += 1
        filteredEmployeesEnteredTextDepartmentFilterReceivedArguments = (employees: employees, enteredText: enteredText, departmentFilter: departmentFilter)
        filteredEmployeesEnteredTextDepartmentFilterReceivedInvocations.append((employees: employees, enteredText: enteredText, departmentFilter: departmentFilter))
        if let filteredEmployeesEnteredTextDepartmentFilterClosure = filteredEmployeesEnteredTextDepartmentFilterClosure {
            return filteredEmployeesEnteredTextDepartmentFilterClosure(employees, enteredText, departmentFilter)
        } else {
            return filteredEmployeesEnteredTextDepartmentFilterReturnValue
        }
    }

}
class EmployeesListRowsFactoryProtocolMock: EmployeesListRowsFactoryProtocol {

    //MARK: - createRowModels

    var createRowModelsFromSortOrderCallsCount = 0
    var createRowModelsFromSortOrderCalled: Bool {
        return createRowModelsFromSortOrderCallsCount > 0
    }
    var createRowModelsFromSortOrderReceivedArguments: (employees: [Employee], sortOrder: EmployeesSortOrder)?
    var createRowModelsFromSortOrderReceivedInvocations: [(employees: [Employee], sortOrder: EmployeesSortOrder)] = []
    var createRowModelsFromSortOrderReturnValue: [any RowProvider]!
    var createRowModelsFromSortOrderClosure: (([Employee], EmployeesSortOrder) -> [any RowProvider])?

    func createRowModels(from employees: [Employee], sortOrder: EmployeesSortOrder) -> [any RowProvider] {
        createRowModelsFromSortOrderCallsCount += 1
        createRowModelsFromSortOrderReceivedArguments = (employees: employees, sortOrder: sortOrder)
        createRowModelsFromSortOrderReceivedInvocations.append((employees: employees, sortOrder: sortOrder))
        if let createRowModelsFromSortOrderClosure = createRowModelsFromSortOrderClosure {
            return createRowModelsFromSortOrderClosure(employees, sortOrder)
        } else {
            return createRowModelsFromSortOrderReturnValue
        }
    }

}
class EmployeesListRowsFactoryStrategyMock: EmployeesListRowsFactoryStrategy {

    //MARK: - rowProviders

    var rowProvidersFromCallsCount = 0
    var rowProvidersFromCalled: Bool {
        return rowProvidersFromCallsCount > 0
    }
    var rowProvidersFromReceivedEmployees: [Employee]?
    var rowProvidersFromReceivedInvocations: [[Employee]] = []
    var rowProvidersFromReturnValue: [any RowProvider]!
    var rowProvidersFromClosure: (([Employee]) -> [any RowProvider])?

    func rowProviders(from employees: [Employee]) -> [any RowProvider] {
        rowProvidersFromCallsCount += 1
        rowProvidersFromReceivedEmployees = employees
        rowProvidersFromReceivedInvocations.append(employees)
        if let rowProvidersFromClosure = rowProvidersFromClosure {
            return rowProvidersFromClosure(employees)
        } else {
            return rowProvidersFromReturnValue
        }
    }

}
class EmployeesListRowsFactoryStrategyProviderProtocolMock: EmployeesListRowsFactoryStrategyProviderProtocol {

    //MARK: - strategy

    var strategyForCallsCount = 0
    var strategyForCalled: Bool {
        return strategyForCallsCount > 0
    }
    var strategyForReceivedSortOrder: EmployeesSortOrder?
    var strategyForReceivedInvocations: [EmployeesSortOrder] = []
    var strategyForReturnValue: EmployeesListRowsFactoryStrategy!
    var strategyForClosure: ((EmployeesSortOrder) -> EmployeesListRowsFactoryStrategy)?

    func strategy(for sortOrder: EmployeesSortOrder) -> EmployeesListRowsFactoryStrategy {
        strategyForCallsCount += 1
        strategyForReceivedSortOrder = sortOrder
        strategyForReceivedInvocations.append(sortOrder)
        if let strategyForClosure = strategyForClosure {
            return strategyForClosure(sortOrder)
        } else {
            return strategyForReturnValue
        }
    }

}
class EmployeesServiceProtocolMock: EmployeesServiceProtocol {

    //MARK: - fetchEmployees

    var fetchEmployeesCompletionCallsCount = 0
    var fetchEmployeesCompletionCalled: Bool {
        return fetchEmployeesCompletionCallsCount > 0
    }
    var fetchEmployeesCompletionReceivedCompletion: ((Result<EmployeesResponse, Error>) -> Void)?
    var fetchEmployeesCompletionReceivedInvocations: [((Result<EmployeesResponse, Error>) -> Void)] = []
    var fetchEmployeesCompletionClosure: ((@escaping (Result<EmployeesResponse, Error>) -> Void) -> Void)?

    func fetchEmployees(completion: @escaping (Result<EmployeesResponse, Error>) -> Void) {
        fetchEmployeesCompletionCallsCount += 1
        fetchEmployeesCompletionReceivedCompletion = completion
        fetchEmployeesCompletionReceivedInvocations.append(completion)
        fetchEmployeesCompletionClosure?(completion)
    }

}
