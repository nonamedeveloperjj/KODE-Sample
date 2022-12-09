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














class EmployeesFilterValidatorProtocolMock: EmployeesFilterValidatorProtocol {

    //MARK: - filtered

    var filteredEmployeesEnteredTextDepartmentFilterCallsCount = 0
    var filteredEmployeesEnteredTextDepartmentFilterCalled: Bool {
        return filteredEmployeesEnteredTextDepartmentFilterCallsCount > 0
    }
    var filteredEmployeesEnteredTextDepartmentFilterReceivedArguments: (employees: [Employee], enteredText: String, departmentFilter: EmployeeDepartmentFilter?)?
    var filteredEmployeesEnteredTextDepartmentFilterReceivedInvocations: [(employees: [Employee], enteredText: String, departmentFilter: EmployeeDepartmentFilter?)] = []
    var filteredEmployeesEnteredTextDepartmentFilterReturnValue: [Employee]!
    var filteredEmployeesEnteredTextDepartmentFilterClosure: (([Employee], String, EmployeeDepartmentFilter?) -> [Employee])?

    func filtered(employees: [Employee], enteredText: String, departmentFilter: EmployeeDepartmentFilter?) -> [Employee] {
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
class HTTPClientProtocolMock: HTTPClientProtocol {

    //MARK: - sendRequest

    var sendRequestRequestComponentsCompletionCallsCount = 0
    var sendRequestRequestComponentsCompletionCalled: Bool {
        return sendRequestRequestComponentsCompletionCallsCount > 0
    }
    var sendRequestRequestComponentsCompletionReceivedArguments: (requestComponents: RequestComponents, completion: (Result<Data?, Error>) -> Void)?
    var sendRequestRequestComponentsCompletionReceivedInvocations: [(requestComponents: RequestComponents, completion: (Result<Data?, Error>) -> Void)] = []
    var sendRequestRequestComponentsCompletionClosure: ((RequestComponents, @escaping (Result<Data?, Error>) -> Void) -> Void)?

    func sendRequest(requestComponents: RequestComponents, completion: @escaping (Result<Data?, Error>) -> Void) {
        sendRequestRequestComponentsCompletionCallsCount += 1
        sendRequestRequestComponentsCompletionReceivedArguments = (requestComponents: requestComponents, completion: completion)
        sendRequestRequestComponentsCompletionReceivedInvocations.append((requestComponents: requestComponents, completion: completion))
        sendRequestRequestComponentsCompletionClosure?(requestComponents, completion)
    }

}
class URLComponentsFactoryProtocolMock: URLComponentsFactoryProtocol {

    //MARK: - create

    var createFromCallsCount = 0
    var createFromCalled: Bool {
        return createFromCallsCount > 0
    }
    var createFromReceivedComponents: RequestComponents?
    var createFromReceivedInvocations: [RequestComponents] = []
    var createFromReturnValue: URLComponents!
    var createFromClosure: ((RequestComponents) -> URLComponents)?

    func create(from components: RequestComponents) -> URLComponents {
        createFromCallsCount += 1
        createFromReceivedComponents = components
        createFromReceivedInvocations.append(components)
        if let createFromClosure = createFromClosure {
            return createFromClosure(components)
        } else {
            return createFromReturnValue
        }
    }

}
class URLRequestFactoryProtocolMock: URLRequestFactoryProtocol {

    //MARK: - create

    var createFromUrlCallsCount = 0
    var createFromUrlCalled: Bool {
        return createFromUrlCallsCount > 0
    }
    var createFromUrlReceivedArguments: (requestComponents: RequestComponents, url: URL)?
    var createFromUrlReceivedInvocations: [(requestComponents: RequestComponents, url: URL)] = []
    var createFromUrlReturnValue: URLRequest!
    var createFromUrlClosure: ((RequestComponents, URL) -> URLRequest)?

    func create(from requestComponents: RequestComponents, url: URL) -> URLRequest {
        createFromUrlCallsCount += 1
        createFromUrlReceivedArguments = (requestComponents: requestComponents, url: url)
        createFromUrlReceivedInvocations.append((requestComponents: requestComponents, url: url))
        if let createFromUrlClosure = createFromUrlClosure {
            return createFromUrlClosure(requestComponents, url)
        } else {
            return createFromUrlReturnValue
        }
    }

}
class URLSessionDataTaskProtocolMock: URLSessionDataTaskProtocol {

    //MARK: - resume

    var resumeCallsCount = 0
    var resumeCalled: Bool {
        return resumeCallsCount > 0
    }
    var resumeClosure: (() -> Void)?

    func resume() {
        resumeCallsCount += 1
        resumeClosure?()
    }

}
class URLSessionProtocolMock: URLSessionProtocol {

    //MARK: - createDataTask

    var createDataTaskWithCompletionHandlerCallsCount = 0
    var createDataTaskWithCompletionHandlerCalled: Bool {
        return createDataTaskWithCompletionHandlerCallsCount > 0
    }
    var createDataTaskWithCompletionHandlerReceivedArguments: (request: URLRequest, completionHandler: (Data?, URLResponse?, Error?) -> Void)?
    var createDataTaskWithCompletionHandlerReceivedInvocations: [(request: URLRequest, completionHandler: (Data?, URLResponse?, Error?) -> Void)] = []
    var createDataTaskWithCompletionHandlerReturnValue: URLSessionDataTaskProtocol!
    var createDataTaskWithCompletionHandlerClosure: ((URLRequest, @Sendable @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol)?

    func createDataTask(with request: URLRequest, completionHandler: @Sendable @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        createDataTaskWithCompletionHandlerCallsCount += 1
        createDataTaskWithCompletionHandlerReceivedArguments = (request: request, completionHandler: completionHandler)
        createDataTaskWithCompletionHandlerReceivedInvocations.append((request: request, completionHandler: completionHandler))
        if let createDataTaskWithCompletionHandlerClosure = createDataTaskWithCompletionHandlerClosure {
            return createDataTaskWithCompletionHandlerClosure(request, completionHandler)
        } else {
            return createDataTaskWithCompletionHandlerReturnValue
        }
    }

}
