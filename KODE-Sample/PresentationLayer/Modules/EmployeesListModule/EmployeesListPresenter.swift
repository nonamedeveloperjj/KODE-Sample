//
//  EmployeesListPresenter.swift
//  KODE-Sample
//
//  Created by John Snow on 12/10/2022.
//

import Foundation

protocol EmployeesListPresenterProtocol {
    func viewIsReady()
}

final class EmployeesListPresenter {
    var view: EmployeesListView?
    private let employeesService: EmployeesService
    
    init(employeesService: EmployeesService) {
        self.employeesService = employeesService
    }
}

extension EmployeesListPresenter: EmployeesListPresenterProtocol {
    func viewIsReady() {
        employeesService.fetchEmployees { result in
            switch result {
            case let .success(employees):
                print(employees)
            case let .failure(error):
                print(error)
            }
        }
    }
}
