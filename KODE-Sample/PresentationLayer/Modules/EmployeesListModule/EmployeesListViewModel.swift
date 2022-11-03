//
//  EmployeesListViewModel.swift
//  KODE-Sample
//
//  Created by John Snow on 03/11/2022.
//

import Foundation

final class EmployeesListViewModel: ObservableObject {
    private let employeesService: EmployeesServiceProtocol
    
    init(employeesService: EmployeesServiceProtocol) {
        self.employeesService = employeesService
    }
    
    func fetchEmployees() {
        employeesService.fetchEmployees { [weak self] result in
            
        }
    }
}
