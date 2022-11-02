//
//  EmployeesListAssembly.swift
//  KODE-Sample
//
//  Created by John Snow on 12/10/2022.
//

import SwiftUI

final class EmployeesListAssembly {
    func createModule() -> EmployeesListView {
        let employeesService = EmployeesService(httpClient: HTTPClientAssembly().create())
        let presenter = EmployeesListPresenter(employeesService: employeesService)
        let view = EmployeesListView(presenter: presenter)
        
        presenter.view = view
        return view
    }
}
