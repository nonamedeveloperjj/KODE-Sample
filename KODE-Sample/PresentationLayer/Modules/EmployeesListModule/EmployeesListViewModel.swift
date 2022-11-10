//
//  EmployeesListViewModel.swift
//  KODE-Sample
//
//  Created by John Snow on 03/11/2022.
//

import Foundation

final class EmployeesListViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    
    private let employeesService: EmployeesServiceProtocol
    
    init(employeesService: EmployeesServiceProtocol) {
        self.employeesService = employeesService
    }
    
    func fetchEmployees() {
        employeesService.fetchEmployees { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    self?.employees = response.items
                case let .failure(error):
                    print(error)
                }                
            }
        }
    }
}
